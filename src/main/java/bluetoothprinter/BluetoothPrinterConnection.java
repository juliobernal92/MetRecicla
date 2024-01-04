/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bluetoothprinter;
import javax.bluetooth.*;
import javax.microedition.io.Connector;
import javax.microedition.io.StreamConnection;
import java.io.IOException;
import java.io.OutputStream;
import javax.swing.JOptionPane;

public class BluetoothPrinterConnection {

    private StreamConnection streamConnection;
    private OutputStream outputStream;

    public void connect(String bluetoothAddress) throws IOException {
        try {
            LocalDevice localDevice = LocalDevice.getLocalDevice();
            DiscoveryAgent discoveryAgent = localDevice.getDiscoveryAgent();

            // Descubrir los dispositivos Bluetooth cercanos
            RemoteDevice[] remoteDevices = discoveryAgent.retrieveDevices(DiscoveryAgent.PREKNOWN);

            RemoteDevice printerDevice = findPrinterDevice(remoteDevices, bluetoothAddress);

            if (printerDevice == null) {
                throw new IOException("No se encontró la impresora Bluetooth con la dirección: " + bluetoothAddress);
            }

            // Establecer una conexión Bluetooth
            String connectionURL = "btspp://" + printerDevice.getBluetoothAddress() + ":1;authenticate=false;encrypt=false;master=false";
            streamConnection = (StreamConnection) Connector.open(connectionURL);
            outputStream = streamConnection.openOutputStream();
        } catch (BluetoothStateException e) {
            throw new IOException("Error al conectarse a la impresora Bluetooth", e);
        }
    }

    private RemoteDevice findPrinterDevice(RemoteDevice[] devices, String address) {
        for (RemoteDevice device : devices) {
            if (device.getBluetoothAddress().equals(address)) {
                return device;
            }
        }
        return null;
    }

    public void disconnect() {
        try {
            if (outputStream != null) {
                outputStream.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (streamConnection != null) {
                    streamConnection.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void sendCommand(String command) throws IOException {
        if (outputStream != null) {
            outputStream.write(command.getBytes());
            outputStream.flush();
        }
    }
}
