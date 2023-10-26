/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package vistas;

import com.formdev.flatlaf.FlatLightLaf;
import dao.ChatarraDAO;
import dao.DetalleTicketDAO;
import dao.TicketDAO;
import dao.TotalDAO;
import dao.VendedorDAO;
import entidades.Chatarra;
import entidades.DetalleTicket;
import entidades.Ticket;
import entidades.Total;
import entidades.Vendedor;
import java.awt.Desktop;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import java.io.File;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import javax.swing.DefaultListModel;
import javax.swing.ImageIcon;
import javax.swing.JFormattedTextField;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import javax.swing.table.DefaultTableModel;
import javax.swing.text.NumberFormatter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRTableModelDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.jdesktop.swingx.autocomplete.AutoCompleteDecorator;
import utilidades.HibernateUtil;

/**
 *
 * @author Doomed666
 */
public class Main extends javax.swing.JFrame {

    /**
     * Creates new form Main
     */
    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    private int total = 0;
    DefaultTableModel tableModel;
    
    public Main() {
        initComponents();
        ConfiInicio();
        
        String imagePath = "C:\\Users\\Doomed666\\Documents\\NetBeansProjects\\MetReciclaAPP\\src\\main\\resources\\icon.png";
        ImageIcon icon = new ImageIcon(imagePath);
        setIconImage(icon.getImage());
        
        txtvendedor.requestFocus();
        
        Date fechaActual = new Date();
        SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
        String fechaActualStr = formatoFecha.format(fechaActual);
        txtfecha.setText(fechaActualStr);
        
        comboBoxChatarra();
        dcfecha1.setDateFormatString("yyyy-MM-dd");
        dcfecha2.setDateFormatString("yyyy-MM-dd");
        
    }
    
    
    private void ConfiInicio(){
        this.setLocationRelativeTo(null);//pone en el centro la pantalla
        setExtendedState(JFrame.MAXIMIZED_BOTH);
   }
    
    private void comboBoxChatarra() {
        ChatarraDAO chatarraDAO = new ChatarraDAO(sessionFactory);
        List<String> nombresChatarra = chatarraDAO.obtenerNombresChatarra();
        for (String nombreChatarra : nombresChatarra) {
            cbchatarra.addItem(nombreChatarra);
            cbchatarrainventario.addItem(nombreChatarra);
        }
        AutoCompleteDecorator.decorate(cbchatarra);

        JTextField editor = (JTextField) cbchatarra.getEditor().getEditorComponent();
        editor.addFocusListener(new FocusAdapter() {
            @Override
            public void focusGained(FocusEvent e) {
                SwingUtilities.invokeLater(() -> {
                    editor.selectAll();
                    cbchatarra.setPopupVisible(true);  
                });
            }
        });

    }
    
    private void actualizarTablaDetalles() {
        DefaultTableModel modelo = (DefaultTableModel) tbdetalles.getModel();
        modelo.setRowCount(0); // Limpiar los datos actuales de la tabla

        String idticketstr = txtidticket.getText().trim();

        if (idticketstr != null) {
            int idTicket = Integer.parseInt(idticketstr);
            DetalleTicketDAO detalleDAO = new DetalleTicketDAO(sessionFactory);
            List<DetalleTicket> detallesTicket = detalleDAO.obtenerPorIdTicket(idTicket);

            // Formateador para mostrar dos decimales
            DecimalFormat decimalFormat = new DecimalFormat("#.00");

            for (DetalleTicket detallesticket : detallesTicket) {
                BigDecimal cantidad = detallesticket.getCantidad();
                ChatarraDAO chtrdao = new ChatarraDAO(sessionFactory);
                Chatarra chatarra = detallesticket.getChatarra(); // Obtener la entidad Chatarra directamente

                if (chatarra != null) {
                    // Aquí puedes acceder a los atributos de Chatarra, como el nombre
                    int idChatarra = chatarra.getIdchatarra();
                    String nombreChatarra = chatarra.getNombre();
                    BigDecimal precio = chatarra.getPrecio();
                    BigDecimal subtotal = cantidad.multiply(precio);

                    // Aplicar el formato a las celdas que contienen números decimales
                    modelo.addRow(new Object[]{
                        idChatarra,
                        decimalFormat.format(cantidad),
                        nombreChatarra,
                        decimalFormat.format(precio),
                        decimalFormat.format(subtotal)
                    });
                }
            }

            tbdetalles.setModel(modelo);
        }
    }
    
    private void sumaTotal() {
        DefaultTableModel modelsuma = (DefaultTableModel) tbdetalles.getModel();
        int rowCount = modelsuma.getRowCount();
        BigDecimal total = BigDecimal.ZERO; // Inicializa el total en 0

        for (int i = 0; i < rowCount; i++) {
            String subtotalStr = modelsuma.getValueAt(i, 4).toString();
            try {
                BigDecimal subtotal = new BigDecimal(subtotalStr.replace(",", ".")); // Reemplaza la coma por un punto para convertir a BigDecimal
                total = total.add(subtotal); // Suma el subtotal al total
            } catch (NumberFormatException e) {
                // Manejar la excepción si el valor no se puede convertir a BigDecimal
            }
        }

        lbltotal.setText(total.toString()); // Muestra el total en formato de texto
    }



    private void limpiarChatarra(){
        txtidchatarra.setText("");
        txtcantidad.setText("");
        txtvendedor.requestFocus();
        cbchatarra.setSelectedIndex(0);
    }
    
    private void limpiarTodo() {
        limpiarChatarra();
        txtidvendedor.setText("");
        txtvendedor.setText("");
        txtcel.setText("");
        txtdireccion.setText("");
        txtidticket.setText("");
        txtvendedor.requestFocus();
        DefaultTableModel modelo = (DefaultTableModel) tbdetalles.getModel();
        modelo.setRowCount(0); // Esto eliminará todas las filas de la tabla
        lbltotal.setText("");
        lblinfocliente.setText("Añadir primero un cliente");
        lblinfochatarra.setText("");
        txtidtotal.setText("");

    }


    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel3 = new javax.swing.JPanel();
        background = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jTabbedPane1 = new javax.swing.JTabbedPane();
        paneDashboard = new javax.swing.JPanel();
        paneCompras = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        txtidvendedor = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        txtvendedor = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        txtcel = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        txtdireccion = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        txtfecha = new javax.swing.JTextField();
        btn_vendedor = new javax.swing.JButton();
        jLabel7 = new javax.swing.JLabel();
        lblinfocliente = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        txtidticket = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        txtidchatarra = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();
        cbchatarra = new javax.swing.JComboBox<>();
        jLabel11 = new javax.swing.JLabel();
        txtprecio = new javax.swing.JTextField();
        jLabel12 = new javax.swing.JLabel();
        txtcantidad = new javax.swing.JTextField();
        btn_añadir = new javax.swing.JButton();
        btn_editar = new javax.swing.JButton();
        btn_eliminar = new javax.swing.JButton();
        btn_limpiar = new javax.swing.JButton();
        lblinfochatarra = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tbdetalles = new javax.swing.JTable();
        btn_limpiar_todo = new javax.swing.JButton();
        lbltotal = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        btn_imprimir = new javax.swing.JButton();
        txtidtotal = new javax.swing.JLabel();
        paneInventario = new javax.swing.JPanel();
        jScrollPane2 = new javax.swing.JScrollPane();
        listachatarra = new javax.swing.JList<>();
        btntodo = new javax.swing.JButton();
        dcfecha1 = new com.toedter.calendar.JDateChooser();
        jLabel14 = new javax.swing.JLabel();
        jLabel15 = new javax.swing.JLabel();
        jLabel16 = new javax.swing.JLabel();
        jLabel17 = new javax.swing.JLabel();
        dcfecha2 = new com.toedter.calendar.JDateChooser();
        btn_mostrarporfecha = new javax.swing.JButton();
        jLabel18 = new javax.swing.JLabel();
        jLabel19 = new javax.swing.JLabel();
        cbchatarrainventario = new javax.swing.JComboBox<>();
        btnmostrarporchatarra = new javax.swing.JButton();
        jLabel20 = new javax.swing.JLabel();
        txtmontocompratotal = new javax.swing.JLabel();
        paneCaja = new javax.swing.JPanel();
        paneResumen = new javax.swing.JPanel();

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 100, Short.MAX_VALUE)
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 100, Short.MAX_VALUE)
        );

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Met Recicla ");

        background.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Segoe UI Semibold", 1, 18)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/recycle32.png"))); // NOI18N
        jLabel1.setText("   MetRecicla");
        background.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 1370, 50));

        javax.swing.GroupLayout paneDashboardLayout = new javax.swing.GroupLayout(paneDashboard);
        paneDashboard.setLayout(paneDashboardLayout);
        paneDashboardLayout.setHorizontalGroup(
            paneDashboardLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 1380, Short.MAX_VALUE)
        );
        paneDashboardLayout.setVerticalGroup(
            paneDashboardLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 659, Short.MAX_VALUE)
        );

        jTabbedPane1.addTab("  DASHBOARD  ", new javax.swing.ImageIcon(getClass().getResource("/home.png")), paneDashboard); // NOI18N

        jLabel2.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel2.setText("ID Vendedor");

        txtidvendedor.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        txtidvendedor.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtidvendedorActionPerformed(evt);
            }
        });

        jLabel3.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel3.setText("Nombre:");

        txtvendedor.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        jLabel4.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel4.setText("Telefono");

        txtcel.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        jLabel5.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel5.setText("Direccion");

        txtdireccion.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        jLabel6.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel6.setText("Fecha");

        txtfecha.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        btn_vendedor.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btn_vendedor.setText("Añadir");
        btn_vendedor.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_vendedorActionPerformed(evt);
            }
        });

        jLabel7.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel7.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel7.setText("Primero debes Añadir los datos del vendedor");

        jLabel8.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel8.setText("ID Ticket");

        txtidticket.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        jLabel9.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel9.setText("ID Chatarra");

        txtidchatarra.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        jLabel10.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel10.setText("Chatarra");

        cbchatarra.setEditable(true);
        cbchatarra.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        cbchatarra.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccionar uno.." }));
        cbchatarra.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cbchatarraActionPerformed(evt);
            }
        });

        jLabel11.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel11.setText("Precio");

        txtprecio.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        jLabel12.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel12.setText("Cantidad");

        txtcantidad.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        txtcantidad.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtcantidadKeyTyped(evt);
            }
        });

        btn_añadir.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btn_añadir.setText("Añadir");
        btn_añadir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_añadirActionPerformed(evt);
            }
        });

        btn_editar.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btn_editar.setText("Editar");

        btn_eliminar.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btn_eliminar.setText("Eliminar");

        btn_limpiar.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btn_limpiar.setText("Limpiar");
        btn_limpiar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_limpiarActionPerformed(evt);
            }
        });

        lblinfochatarra.setText("      ");

        tbdetalles.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "Cantidad", "Detalles", "Precio", "Subtotal"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, true
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(tbdetalles);
        if (tbdetalles.getColumnModel().getColumnCount() > 0) {
            tbdetalles.getColumnModel().getColumn(0).setResizable(false);
            tbdetalles.getColumnModel().getColumn(0).setPreferredWidth(35);
            tbdetalles.getColumnModel().getColumn(1).setResizable(false);
            tbdetalles.getColumnModel().getColumn(2).setResizable(false);
            tbdetalles.getColumnModel().getColumn(3).setResizable(false);
        }

        btn_limpiar_todo.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btn_limpiar_todo.setText("Limpiar Todo");
        btn_limpiar_todo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_limpiar_todoActionPerformed(evt);
            }
        });

        lbltotal.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        lbltotal.setText("      ");

        jLabel13.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel13.setText("TOTAL");

        btn_imprimir.setText("IMPRIMIR COMPROBANTE");
        btn_imprimir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_imprimirActionPerformed(evt);
            }
        });

        txtidtotal.setForeground(new java.awt.Color(255, 255, 255));
        txtidtotal.setText("     ");

        javax.swing.GroupLayout paneComprasLayout = new javax.swing.GroupLayout(paneCompras);
        paneCompras.setLayout(paneComprasLayout);
        paneComprasLayout.setHorizontalGroup(
            paneComprasLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(paneComprasLayout.createSequentialGroup()
                .addGap(52, 52, 52)
                .addGroup(paneComprasLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jLabel7, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(paneComprasLayout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addGap(18, 18, 18)
                        .addComponent(txtidvendedor, javax.swing.GroupLayout.PREFERRED_SIZE, 56, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel3)
                        .addGap(18, 18, 18)
                        .addComponent(txtvendedor, javax.swing.GroupLayout.PREFERRED_SIZE, 206, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel4)
                        .addGap(18, 18, 18)
                        .addComponent(txtcel, javax.swing.GroupLayout.PREFERRED_SIZE, 132, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel5)
                        .addGap(18, 18, 18)
                        .addComponent(txtdireccion, javax.swing.GroupLayout.PREFERRED_SIZE, 192, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel6)
                        .addGap(18, 18, 18)
                        .addComponent(txtfecha, javax.swing.GroupLayout.PREFERRED_SIZE, 103, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(btn_vendedor))
                    .addComponent(lblinfocliente, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(paneComprasLayout.createSequentialGroup()
                        .addComponent(jLabel8)
                        .addGap(18, 18, 18)
                        .addComponent(txtidticket, javax.swing.GroupLayout.PREFERRED_SIZE, 55, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel9)
                        .addGap(18, 18, 18)
                        .addComponent(txtidchatarra, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel10)
                        .addGap(18, 18, 18)
                        .addComponent(cbchatarra, javax.swing.GroupLayout.PREFERRED_SIZE, 134, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel11)
                        .addGap(18, 18, 18)
                        .addComponent(txtprecio)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel12)
                        .addGap(18, 18, 18)
                        .addComponent(txtcantidad, javax.swing.GroupLayout.PREFERRED_SIZE, 72, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(btn_añadir, javax.swing.GroupLayout.PREFERRED_SIZE, 78, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(btn_editar, javax.swing.GroupLayout.PREFERRED_SIZE, 78, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(btn_eliminar)
                        .addGap(18, 18, 18)
                        .addComponent(btn_limpiar, javax.swing.GroupLayout.PREFERRED_SIZE, 78, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(lblinfochatarra, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jScrollPane1)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, paneComprasLayout.createSequentialGroup()
                        .addComponent(btn_limpiar_todo)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txtidtotal)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(paneComprasLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(paneComprasLayout.createSequentialGroup()
                                .addComponent(jLabel13)
                                .addGap(18, 18, 18)
                                .addComponent(lbltotal, javax.swing.GroupLayout.PREFERRED_SIZE, 146, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(btn_imprimir, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
                .addContainerGap(113, Short.MAX_VALUE))
        );
        paneComprasLayout.setVerticalGroup(
            paneComprasLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(paneComprasLayout.createSequentialGroup()
                .addGap(32, 32, 32)
                .addComponent(jLabel7)
                .addGap(18, 18, 18)
                .addGroup(paneComprasLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(txtidvendedor, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3)
                    .addComponent(txtvendedor, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4)
                    .addComponent(txtcel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel5)
                    .addComponent(txtdireccion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel6)
                    .addComponent(txtfecha, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btn_vendedor))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(lblinfocliente, javax.swing.GroupLayout.PREFERRED_SIZE, 18, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(paneComprasLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel8)
                    .addComponent(txtidticket, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel9)
                    .addComponent(txtidchatarra, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel10)
                    .addComponent(cbchatarra, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel11)
                    .addComponent(txtprecio, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel12)
                    .addComponent(txtcantidad, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btn_añadir)
                    .addComponent(btn_editar)
                    .addComponent(btn_eliminar)
                    .addComponent(btn_limpiar))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(lblinfochatarra)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 295, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(paneComprasLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btn_limpiar_todo)
                    .addComponent(lbltotal)
                    .addComponent(jLabel13)
                    .addComponent(txtidtotal))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(btn_imprimir)
                .addContainerGap(84, Short.MAX_VALUE))
        );

        jTabbedPane1.addTab("  COMPRAS  ", new javax.swing.ImageIcon(getClass().getResource("/payment.png")), paneCompras); // NOI18N

        listachatarra.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jScrollPane2.setViewportView(listachatarra);

        btntodo.setText("Mostrar Todo / Actualizar");
        btntodo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btntodoActionPerformed(evt);
            }
        });

        dcfecha1.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        jLabel14.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel14.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel14.setText("Mostrar toda la chatarra disponible");

        jLabel15.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel15.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel15.setText("Mostrar por Fechas");

        jLabel16.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel16.setText("Desde:");

        jLabel17.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel17.setText("Hasta:");

        dcfecha2.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        btn_mostrarporfecha.setText("Mostrar por Fecha");
        btn_mostrarporfecha.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_mostrarporfechaActionPerformed(evt);
            }
        });

        jLabel18.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel18.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel18.setText("Mostrar por Chatarra");

        jLabel19.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel19.setText("Seleccionar:");

        cbchatarrainventario.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        cbchatarrainventario.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccionar uno..." }));

        btnmostrarporchatarra.setText("Mostrar por Chatarra");
        btnmostrarporchatarra.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnmostrarporchatarraActionPerformed(evt);
            }
        });

        jLabel20.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel20.setText("Monto Total:");

        txtmontocompratotal.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        txtmontocompratotal.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        txtmontocompratotal.setText("  ");

        javax.swing.GroupLayout paneInventarioLayout = new javax.swing.GroupLayout(paneInventario);
        paneInventario.setLayout(paneInventarioLayout);
        paneInventarioLayout.setHorizontalGroup(
            paneInventarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, paneInventarioLayout.createSequentialGroup()
                .addGap(46, 46, 46)
                .addGroup(paneInventarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(paneInventarioLayout.createSequentialGroup()
                        .addComponent(jLabel19, javax.swing.GroupLayout.DEFAULT_SIZE, 94, Short.MAX_VALUE)
                        .addGap(18, 18, 18)
                        .addComponent(cbchatarrainventario, javax.swing.GroupLayout.PREFERRED_SIZE, 335, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jLabel14, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btntodo, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(paneInventarioLayout.createSequentialGroup()
                        .addComponent(jLabel16)
                        .addGap(18, 18, 18)
                        .addComponent(dcfecha1, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel17)
                        .addGap(18, 18, 18)
                        .addComponent(dcfecha2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addComponent(jLabel15, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btn_mostrarporfecha, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel18, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnmostrarporchatarra, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(51, 51, 51)
                .addGroup(paneInventarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(paneInventarioLayout.createSequentialGroup()
                        .addComponent(jLabel20)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(txtmontocompratotal, javax.swing.GroupLayout.PREFERRED_SIZE, 306, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 535, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(301, 301, 301))
        );
        paneInventarioLayout.setVerticalGroup(
            paneInventarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(paneInventarioLayout.createSequentialGroup()
                .addGap(41, 41, 41)
                .addGroup(paneInventarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(paneInventarioLayout.createSequentialGroup()
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 402, Short.MAX_VALUE)
                        .addGap(18, 18, 18)
                        .addGroup(paneInventarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel20)
                            .addComponent(txtmontocompratotal))
                        .addGap(178, 178, 178))
                    .addGroup(paneInventarioLayout.createSequentialGroup()
                        .addComponent(jLabel14)
                        .addGap(18, 18, 18)
                        .addComponent(btntodo)
                        .addGap(14, 14, 14)
                        .addComponent(jLabel15)
                        .addGap(18, 18, 18)
                        .addGroup(paneInventarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jLabel16)
                            .addComponent(dcfecha1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(paneInventarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addComponent(jLabel17)
                                .addComponent(dcfecha2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(18, 18, 18)
                        .addComponent(btn_mostrarporfecha)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel18)
                        .addGap(18, 18, 18)
                        .addGroup(paneInventarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel19)
                            .addComponent(cbchatarrainventario, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addComponent(btnmostrarporchatarra)
                        .addContainerGap(319, Short.MAX_VALUE))))
        );

        jTabbedPane1.addTab("  INVENTARIO  ", new javax.swing.ImageIcon(getClass().getResource("/inventario.png")), paneInventario); // NOI18N

        javax.swing.GroupLayout paneCajaLayout = new javax.swing.GroupLayout(paneCaja);
        paneCaja.setLayout(paneCajaLayout);
        paneCajaLayout.setHorizontalGroup(
            paneCajaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 1380, Short.MAX_VALUE)
        );
        paneCajaLayout.setVerticalGroup(
            paneCajaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 659, Short.MAX_VALUE)
        );

        jTabbedPane1.addTab("  CAJA  ", new javax.swing.ImageIcon(getClass().getResource("/cash-machine.png")), paneCaja); // NOI18N

        javax.swing.GroupLayout paneResumenLayout = new javax.swing.GroupLayout(paneResumen);
        paneResumen.setLayout(paneResumenLayout);
        paneResumenLayout.setHorizontalGroup(
            paneResumenLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 1380, Short.MAX_VALUE)
        );
        paneResumenLayout.setVerticalGroup(
            paneResumenLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 659, Short.MAX_VALUE)
        );

        jTabbedPane1.addTab("  RESUMEN  ", new javax.swing.ImageIcon(getClass().getResource("/bank.png")), paneResumen); // NOI18N

        background.add(jTabbedPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 80, 1380, 700));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(background, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(background, javax.swing.GroupLayout.DEFAULT_SIZE, 794, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void añadirTicket(){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Ticket ticket = new Ticket();
        String fecha = txtfecha.getText();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaok = null;

        try {
            fechaok = sdf.parse(fecha);
        } catch (ParseException ex) {
            // Manejar la excepción aquí, por ejemplo, mostrar un mensaje de error o realizar alguna acción adicional
            System.out.println("Error al parsear la fecha: " + ex.getMessage());
        }
        ticket.setFecha(fechaok);
        VendedorDAO vndr = new VendedorDAO(sessionFactory);
        Vendedor vendedor = new Vendedor();
        int idVendedor = Integer.parseInt(txtidvendedor.getText());
        ticket.setVendedor(vndr.findById(idVendedor));
        session.save(ticket);
        
        int idTicket = ticket.getIdticket();

        // Mostrar el ID en el campo de texto txtidvendedor
        txtidticket.setText(String.valueOf(idTicket));
        transaction.commit();
        session.close();
    }
    
    private void añadirTotal() {
    
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Total total = new Total();
        TicketDAO ticketDao =  new TicketDAO(sessionFactory);
        Ticket ticketid = ticketDao.findById(Integer.parseInt(txtidticket.getText().trim()));
        total.setTicket(ticketid);
        
        String totalstr = lbltotal.getText().trim();
        double totaldouble = Double.parseDouble(totalstr);
        int totalint = (int) totaldouble;
        total.setTotal(totalint);
        session.save(total);
        
        int idTotal = total.getIdtotal();
        txtidtotal.setText(String.valueOf(idTotal));
        transaction.commit();
        session.close();
        System.out.println("total: "+totalint);
}

    private void btn_vendedorActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_vendedorActionPerformed
        // TODO add your handling code here:
        String vendedorNombre = txtvendedor.getText().trim();
        String telefono = txtcel.getText().trim();
        String direccion = txtdireccion.getText().trim();

        if (!vendedorNombre.isEmpty() && !telefono.isEmpty() && !direccion.isEmpty()) {
            try {
                // Obtener una sesión de Hibernate a partir del SessionFactory
                Session session = sessionFactory.openSession();
                Transaction transaction = session.beginTransaction();

                // Crear un nuevo vendedor y configurar sus atributos
                Vendedor vendedor = new Vendedor();
                vendedor.setNombre(vendedorNombre);
                vendedor.setTelefono(telefono);
                vendedor.setDireccion(direccion);

                // Guardar el vendedor en la base de datos
                session.save(vendedor);

                // Después de guardar, obtén el ID del vendedor
                int idVendedor = vendedor.getIdvendedor();

                // Mostrar el ID en el campo de texto txtidvendedor
                txtidvendedor.setText(String.valueOf(idVendedor));

                // Confirmar la transacción
                transaction.commit();

                // Cerrar la sesión
                session.close();

                // Mostrar un mensaje de éxito
                lblinfocliente.setText("<html><font color='Green'>Añadido correctamente</font></html>");
            } catch (Exception e) {
                // Capturar cualquier excepción que ocurra durante la inserción
                e.printStackTrace();
                lblinfocliente.setText("<html><font color='red'><b>Error al añadir</b></font></html>");
            }
        } else {
            lblinfocliente.setText("<html><font color='red'><b>Añada todos los campos</b></font></html>");
        }

        añadirTicket();
    }//GEN-LAST:event_btn_vendedorActionPerformed

    private void btn_añadirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_añadirActionPerformed
        // TODO add your handling code here:
        String cantidad = txtcantidad.getText().trim();
        String chatarra = cbchatarra.getSelectedItem().toString().trim();
        String precio = txtprecio.getText().trim();
        Object primerItem = cbchatarra.getItemAt(0);

        if (!cantidad.isEmpty() && !chatarra.equals(primerItem)  && !precio.isEmpty()) {
            DetalleTicket detalle = new DetalleTicket();

            // Obtener el Vendedor correspondiente según el ID
            int idVendedor = Integer.parseInt(txtidvendedor.getText());
            VendedorDAO vndDao = new VendedorDAO(sessionFactory);
            Vendedor vendedor = vndDao.obtenerVendedorPorId(idVendedor); // Debes implementar esta función

            // Obtener la Chatarra correspondiente según el ID
            int idChatarra = Integer.parseInt(txtidchatarra.getText());
            ChatarraDAO chtrdao = new ChatarraDAO(sessionFactory);
            Chatarra chatarr = chtrdao.obtenerChatarraPorId(idChatarra); // Debes implementar esta función

            BigDecimal cantBD = new BigDecimal(cantidad);
            BigDecimal precioBD = new BigDecimal(precio);

            detalle.setVendedor(vendedor); // Establecer el objeto Vendedor
            detalle.setChatarra(chatarr); // Establecer el objeto Chatarra
            detalle.setCantidad(cantBD);
            detalle.setSubtotal(cantBD.multiply(precioBD));

            // Ahora, asumimos que tienes un objeto Ticket al que deseas asociar el detalle.
            // Debes obtener el Ticket correspondiente y establecerlo en el detalle.
            int idTicket = Integer.parseInt(txtidticket.getText());
            TicketDAO tktdao = new TicketDAO(sessionFactory);
            Ticket ticket = tktdao.findById(idTicket); // Debes implementar esta función

            // Establecer el Ticket en el detalle
            detalle.setTicket(ticket);

            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();

            session.save(detalle);
            transaction.commit();
            session.close();
        }else{
            lblinfochatarra.setText("<html><font color='red'><b>Añada todos los campos</b></font></html>");
        }

        actualizarTablaDetalles();
        limpiarChatarra();
        sumaTotal();
        cbchatarra.setSelectedIndex(0);
        cbchatarra.requestFocus();
    }//GEN-LAST:event_btn_añadirActionPerformed

    private void cbchatarraActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cbchatarraActionPerformed
        // TODO add your handling code here:
        // Obtener el nombre del material seleccionado en cbchatarra
        String materialSeleccionado = (String) cbchatarra.getSelectedItem();
        
        // Aquí debes buscar el precio correspondiente en la base de datos o en una lista de materiales
        // Puedes usar el DAO de Chatarra para buscar el precio por nombre
        
        // Ejemplo de búsqueda del precio por nombre utilizando el DAO de Chatarra
        ChatarraDAO chatarraDAO = new ChatarraDAO(sessionFactory);
        Chatarra chatarra = chatarraDAO.findByNombre(materialSeleccionado);
        
        // Verificar si se encontró el material
        if (chatarra != null) {
            // Actualizar el campo txtprecio con el precio obtenido
            txtprecio.setText(String.valueOf(chatarra.getPrecio()));
            txtidchatarra.setText(String.valueOf(chatarra.getIdchatarra()));
        } else {
            // Si no se encontró el material, puedes manejarlo adecuadamente aquí
            txtprecio.setText("");
        }
    }//GEN-LAST:event_cbchatarraActionPerformed

    private void btn_imprimirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_imprimirActionPerformed
        // TODO add your handling code here:
        añadirTotal();
        try{
            tableModel = new DefaultTableModel();
            tableModel.addColumn("Cliente");
            tableModel.addColumn("Telefono");
            tableModel.addColumn("Direccion");
            tableModel.addColumn("Fecha");
            tableModel.addColumn("Id");
            tableModel.addColumn("Cantidad");
            tableModel.addColumn("Descripcion");
            tableModel.addColumn("Precio");
            tableModel.addColumn("Subtotal");
            tableModel.addColumn("TOTAL:");
            
            
            int idticket = Integer.parseInt(txtidticket.getText());
            String idTicketStr = txtidticket.getText();
            
            VendedorDAO vndrdao = new VendedorDAO(sessionFactory);
            int idvendedor = Integer.parseInt(txtidvendedor.getText());
            Vendedor vendedor = vndrdao.findById(idvendedor);
            
            TicketDAO tktdao =  new TicketDAO(sessionFactory);
            Ticket tkt = tktdao.findById(idticket);
            
            int idtotal = Integer.parseInt(txtidtotal.getText());

            TotalDAO totalDao = new TotalDAO(sessionFactory);
            Total total = totalDao.findById(idtotal);

            NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US); // Puedes cambiar la localización si es necesario

            DetalleTicketDAO dtlldao = new DetalleTicketDAO(sessionFactory);
            List<DetalleTicket> listaDetalle = dtlldao.obtenerPorIdTicket(idticket);
            for (DetalleTicket dtlltckt : listaDetalle) {
                Chatarra chtrrid = dtlltckt.getChatarra();

                String cantidadFormateada = numberFormat.format(dtlltckt.getCantidad());
                String precioFormateado = numberFormat.format(chtrrid.getPrecio());
                String subtotalFormateado = numberFormat.format(dtlltckt.getSubtotal());
                String totalFormateado = numberFormat.format(total.getTotal());

                tableModel.addRow(new Object[]{
                    vendedor.getNombre(), vendedor.getTelefono(), vendedor.getDireccion(),
                    tkt.getFecha(),
                    chtrrid.getIdchatarra(),
                    cantidadFormateada, // Valor formateado con separador de miles
                    chtrrid.getNombre(),
                    precioFormateado, // Valor formateado con separador de miles
                    subtotalFormateado, // Valor formateado con separador de miles
                    totalFormateado

                });
            }

            File file = new File("C:\\Users\\Doomed666\\Documents\\NetBeansProjects\\MetReciclaAPP\\src\\main\\java\\reportes\\RPTicket.jasper");
            JasperReport reporte = (JasperReport) JRLoader.loadObject(file);
            JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, new HashMap(), new JRTableModelDataSource(tableModel));
            String nombreArchivo = idTicketStr + ".pdf";
            JasperExportManager.exportReportToPdfFile(jasperPrint, "C:\\Users\\Doomed666\\Documents\\NetBeansProjects\\MetReciclaAPP\\src\\main\\java\\pdf\\"+nombreArchivo);

            File pdfFile = new File("C:\\Users\\Doomed666\\Documents\\NetBeansProjects\\MetReciclaAPP\\src\\main\\java\\pdf\\"+nombreArchivo);
            Desktop.getDesktop().open(pdfFile);
            
        }catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Por favor complete todos los campos" + ex.getMessage());
        }
        
        limpiarTodo();
    }//GEN-LAST:event_btn_imprimirActionPerformed

    private void btn_limpiar_todoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_limpiar_todoActionPerformed
        // TODO add your handling code here:
        limpiarTodo();
    }//GEN-LAST:event_btn_limpiar_todoActionPerformed

    private void btn_limpiarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_limpiarActionPerformed
        // TODO add your handling code here:
        limpiarChatarra();
    }//GEN-LAST:event_btn_limpiarActionPerformed

    private void buscarVendedorPorID() {
        try {
            int id = Integer.parseInt(txtidvendedor.getText()); // Obtener el ID del JTextField
            VendedorDAO vendedorDAO = new VendedorDAO(sessionFactory); // Debes tener una instancia de SessionFactory
            Vendedor vendedor = vendedorDAO.obtenerVendedorPorId(id);

            if (vendedor != null) {
                // Llenar los JTextField con la información del vendedor
                txtvendedor.setText(vendedor.getNombre());
                txtdireccion.setText(vendedor.getDireccion());
                txtcel.setText(vendedor.getTelefono());
                añadirTicket();
                lblinfocliente.setText("<html><font color='Green'>Añadido correctamente</font></html>");
            } else {
                JOptionPane.showMessageDialog(this, "Vendedor no encontrado.");
                // Limpia los JTextField en caso de que el ID no coincida con ningún vendedor
                txtvendedor.setText("");
                txtdireccion.setText("");
                txtcel.setText("");
            }
        } catch (NumberFormatException ex) {
            JOptionPane.showMessageDialog(this, "ID no válido.");
        }
    }
    
    private void txtidvendedorActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtidvendedorActionPerformed
        // TODO add your handling code here:
        buscarVendedorPorID();
    }//GEN-LAST:event_txtidvendedorActionPerformed

    private void btntodoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btntodoActionPerformed
        DefaultListModel<String> listModel = new DefaultListModel<>();
        BigDecimal montoCantidadTotal = BigDecimal.ZERO; // Variable para mantener el monto total de cantidad

        Session session = sessionFactory.openSession();
        session.beginTransaction();

        try {
            SQLQuery query = session.createSQLQuery("SELECT c.nombre, SUM(dt.cantidad) as total_cantidad, SUM(dt.subtotal) as total_subtotal "
                    + "FROM DetallesTicket dt "
                    + "INNER JOIN Chatarra c ON dt.idchatarra = c.idchatarra "
                    + "GROUP BY c.nombre "
                    + "ORDER BY total_subtotal DESC");

            List<Object[]> resultados = query.list();

            DecimalFormat df = new DecimalFormat("#,###.##");

            for (Object[] resultado : resultados) {
                String nombreChatarra = (String) resultado[0];
                BigDecimal totalCantidad = (BigDecimal) resultado[1];
                BigDecimal totalSubtotal = (BigDecimal) resultado[2];

                montoCantidadTotal = montoCantidadTotal.add(totalSubtotal); // Sumar al monto total de cantidad

                String totalSubtotalFormateado = df.format(totalSubtotal);

                String formattedText = "<html><b>Nombre:</b> " + nombreChatarra + "<br><b>Cantidad:</b> " + totalCantidad + "<br><b>Subtotal:</b> " + totalSubtotalFormateado + "<br><br></html>";

                listModel.addElement(formattedText);
            }

            // Cerrar la sesión de Hibernate
            session.getTransaction().commit();
            session.close();

            // Actualizar el JLabel con el monto total de cantidad
            txtmontocompratotal.setText(df.format(montoCantidadTotal));

        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Error al ejecutar la consulta: " + e.getMessage());
            session.getTransaction().rollback();
            session.close();
        }

        listachatarra.setModel(listModel);

    }//GEN-LAST:event_btntodoActionPerformed

    private void btn_mostrarporfechaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_mostrarporfechaActionPerformed
        DefaultListModel<String> listModel = new DefaultListModel<>();

        // Inicializar el subtotal total
        BigDecimal subtotalTotal = BigDecimal.ZERO;

        // Obtener las fechas seleccionadas en los JDateChooser
        Date fechaInicio = dcfecha1.getDate();
        Date fechaFin = dcfecha2.getDate();

        // Obtener una sesión de Hibernate
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        try {
            // Ejecutar la consulta usando HQL para obtener los nombres de chatarra y la suma de cantidad y subtotal en un rango de fechas, ordenados por subtotal en orden descendente
            List<Object[]> resultados = session.createQuery(
                    "SELECT c.nombre, SUM(dt.cantidad), SUM(dt.subtotal) "
                    + "FROM DetalleTicket dt "
                    + "INNER JOIN dt.chatarra c "
                    + "INNER JOIN dt.ticket t "
                    + "WHERE t.fecha BETWEEN :fechaInicio AND :fechaFin "
                    + "GROUP BY c.nombre "
                    + "ORDER BY SUM(dt.subtotal) DESC", Object[].class)
                    .setParameter("fechaInicio", fechaInicio)
                    .setParameter("fechaFin", fechaFin)
                    .getResultList();

            DecimalFormat df = new DecimalFormat("#,###.##");

            for (Object[] resultado : resultados) {
                String nombreChatarra = (String) resultado[0];
                BigDecimal totalCantidad = (BigDecimal) resultado[1];
                BigDecimal totalSubtotal = (BigDecimal) resultado[2];

                // Sumar el subtotal al subtotal total
                subtotalTotal = subtotalTotal.add(totalSubtotal);

                // Formatear los totales con separadores de miles
                String totalCantidadFormateado = df.format(totalCantidad);
                String totalSubtotalFormateado = df.format(totalSubtotal);

                // Formatear el texto con etiquetas HTML
                String formattedText = "<html><b>Nombre:</b> " + nombreChatarra + "<br><b>Cantidad:</b> " + totalCantidadFormateado + "<br><b>Subtotal:</b> " + totalSubtotalFormateado + "<br><br></html>";

                listModel.addElement(formattedText);
            }

            // Cerrar la sesión de Hibernate
            session.getTransaction().commit();
            session.close();

            // Mostrar el subtotal total en el JLabel
            txtmontocompratotal.setText(df.format(subtotalTotal));

        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Error al ejecutar la consulta: " + e.getMessage());
            session.getTransaction().rollback();
            session.close();
        }

        // Asignar el modelo al JList
        listachatarra.setModel(listModel);
    }//GEN-LAST:event_btn_mostrarporfechaActionPerformed

    private void btnmostrarporchatarraActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnmostrarporchatarraActionPerformed

        DefaultListModel<String> listModel = new DefaultListModel<>();
        String chatarraSeleccionada = (String) cbchatarrainventario.getSelectedItem();

        if (chatarraSeleccionada != null) {
            Session session = sessionFactory.openSession();
            session.beginTransaction();

            try {
                SQLQuery query = session.createSQLQuery("SELECT SUM(dt.cantidad) as total_cantidad, SUM(dt.subtotal) as total_subtotal "
                        + "FROM DetallesTicket dt "
                        + "INNER JOIN Chatarra c ON dt.idchatarra = c.idchatarra "
                        + "WHERE c.nombre = :chatarraNombre")
                        .setParameter("chatarraNombre", chatarraSeleccionada);

                List<Object[]> resultados = query.list();

                if (!resultados.isEmpty()) {
                    Object[] resultado = resultados.get(0);
                    BigDecimal totalCantidad = (BigDecimal) resultado[0];
                    BigDecimal totalSubtotal = (BigDecimal) resultado[1];

                    // Aquí calculamos el total acumulado
                    BigDecimal totalCompraTotal = totalSubtotal;

                    DecimalFormat df = new DecimalFormat("#,###.##");
                    String totalCantidadFormateado = df.format(totalCantidad);
                    String totalSubtotalFormateado = df.format(totalSubtotal);
                    String totalCompraTotalFormateado = df.format(totalCompraTotal);

                    String formattedText = "<html><b>Total Cantidad:</b> " + totalCantidadFormateado + "<br><b>Total Subtotal:</b> " + totalSubtotalFormateado + "<br><br></html>";

                    listModel.clear();
                    listModel.addElement(formattedText);

                    // Setear el total de compra total al campo txtmontocompratotal
                    txtmontocompratotal.setText(totalCompraTotalFormateado);

                    session.getTransaction().commit();
                    session.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
                JOptionPane.showMessageDialog(this, "Error al ejecutar la consulta: " + e.getMessage());
                session.getTransaction().rollback();
                session.close();
            }

            listachatarra.setModel(listModel);
        }

    }//GEN-LAST:event_btnmostrarporchatarraActionPerformed

    private void txtcantidadKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtcantidadKeyTyped
        char key = evt.getKeyChar();

        if (key == '.' && txtcantidad.getText().contains(".")) {
            // Si ya hay un punto decimal en el texto, consume el evento
            evt.consume();
        } else if ((key >= '0' && key <= '9') || key == '.') {
            // Permitir dígitos y un punto decimal
        } else {
            // Caracter no válido, consume el evento y muestra un mensaje de advertencia
            evt.consume();
            if (key == ',') {
                JOptionPane.showMessageDialog(this, "El punto decimal debe ser un punto '.', no una coma ','");
            }
        }
    }//GEN-LAST:event_txtcantidadKeyTyped

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            UIManager.setLookAndFeel(new FlatLightLaf());
        } catch (Exception ex) {
            System.err.println("Failed to initialize LaF");
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Main().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel background;
    private javax.swing.JButton btn_añadir;
    private javax.swing.JButton btn_editar;
    private javax.swing.JButton btn_eliminar;
    private javax.swing.JButton btn_imprimir;
    private javax.swing.JButton btn_limpiar;
    private javax.swing.JButton btn_limpiar_todo;
    private javax.swing.JButton btn_mostrarporfecha;
    private javax.swing.JButton btn_vendedor;
    private javax.swing.JButton btnmostrarporchatarra;
    private javax.swing.JButton btntodo;
    private javax.swing.JComboBox<String> cbchatarra;
    private javax.swing.JComboBox<String> cbchatarrainventario;
    private com.toedter.calendar.JDateChooser dcfecha1;
    private com.toedter.calendar.JDateChooser dcfecha2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel18;
    private javax.swing.JLabel jLabel19;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel20;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTabbedPane jTabbedPane1;
    private javax.swing.JLabel lblinfochatarra;
    private javax.swing.JLabel lblinfocliente;
    private javax.swing.JLabel lbltotal;
    private javax.swing.JList<String> listachatarra;
    private javax.swing.JPanel paneCaja;
    private javax.swing.JPanel paneCompras;
    private javax.swing.JPanel paneDashboard;
    private javax.swing.JPanel paneInventario;
    private javax.swing.JPanel paneResumen;
    private javax.swing.JTable tbdetalles;
    private javax.swing.JTextField txtcantidad;
    private javax.swing.JTextField txtcel;
    private javax.swing.JTextField txtdireccion;
    private javax.swing.JTextField txtfecha;
    private javax.swing.JTextField txtidchatarra;
    private javax.swing.JTextField txtidticket;
    private javax.swing.JLabel txtidtotal;
    private javax.swing.JTextField txtidvendedor;
    private javax.swing.JLabel txtmontocompratotal;
    private javax.swing.JTextField txtprecio;
    private javax.swing.JTextField txtvendedor;
    // End of variables declaration//GEN-END:variables
}
