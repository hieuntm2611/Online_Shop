/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.Receiver;
import model.Setting;
import model.User;

/**
 *
 * @author Admin
 */
public class OrderDBContext extends DBContext {

    public ArrayList<Order> getOrder(int uid, int currentPage) {
        ArrayList<Order> orders = new ArrayList();
        try {
            String sql = "SELECT o.[OrderID]\n"
                    + "                                          ,o.[CustomerID]\n"
                    + "                                          ,o.[Order_Date]\n"
                    + "                                          ,o.[Total_Bill]\n"
                    + "                                          ,o.[StatusID]\n"
                    + "                                          ,o.[Note]\n"
                    + "                                          ,o.[Order_Address]\n"
                    + "                                          ,o.Receiver_Name\n"
                    + "                    			     ,o.Receiver_Phone\n"
                    + "                                          ,u.[UserID]\n"
                    + "                    				,u.[Phone]\n"
                    + "                    				,u.[Name]\n"
                    + "                    				,u.[Gender]\n"
                    + "                    				,u.[Password]\n"
                    + "                    				,u.[Email]\n"
                    + "                    				,u.[Address]\n"
                    + "                    				,u.[RoleID]\n"
                    + "                    				,u.[Registered_At]\n"
                    + "                    				,u.[Last_Login]\n"
                    + "                    				,u.[Avatar]\n"
                    + "                    				,u.[DOB]\n"
                    + "                    				,u.[Status]\n"
                    + "                                        FROM [Order] o INNER JOIN [User] u on o.[CustomerID] = u.[UserID] WHERE o.[CustomerID] = ?\n"
                    + "ORDER BY [Order_Date] DESC\n"
                    + "OFFSET (?-1)*5 ROWS\n"
                    + "FETCH NEXT 5 ROWS ONLY";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            stm.setInt(2, currentPage);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrderID(rs.getInt("OrderID"));
                User s = new User();
                s.setUserID(rs.getInt("UserID"));
                s.setName(rs.getString("Receiver_Name"));
                s.setEmail(rs.getString("Email"));
                s.setGender(rs.getBoolean("Gender"));
                s.setPhone(rs.getString("Receiver_Phone"));
                s.setAvatar(rs.getString("Avatar"));
                s.setAddress(rs.getString("Order_Address"));
                o.setCusID(s);
                o.setOrderDate(rs.getDate("Order_Date"));
                o.setTotalBill(0);
                o.setOrderAddress(rs.getString("Order_Address"));
                Setting st = new Setting();
                st.setSettingID(rs.getInt("StatusID"));
                o.setStatus(st);
                o.setNote(rs.getString("Note"));
                orders.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public ArrayList<OrderDetail> getProductInOrder(int orderID) {
        ArrayList<OrderDetail> products = new ArrayList();
        try {
            String sql = "SELECT o.[OrderID]\n"
                    + "                    	  ,od.[ProductID]\n"
                    + "                    	  ,od.[ProductID]\n"
                    + "                    	  ,od.[Quantity]\n"
                    + "                    	  ,od.[Price_Order]\n"
                    + "                    	  , p.[ProductID]\n"
                    + "                          ,p.[Author]\n"
                    + "                          ,p.[Title]\n"
                    + "                          ,p.[Summary]\n"
                    + "                          ,p.[CategoryID]\n"
                    + "                          ,p.[Price]\n"
                    + "                          ,p.[Discount]\n"
                    + "                          ,p.[Quantity]\n"
                    + "                          ,p.[Created_At]\n"
                    + "                          ,p.[Update_At]\n"
                    + "                          ,p.[Status]\n"
                    + "                          ,p.[thumbnail]\n"
                    + "                          ,p.[View]\n"
                    + "                          ,p.[Rate]\n"
                    + "                    	     ,u.[Email]\n"
                    + "                          ,u.[Name]\n"
                    + "                          ,u.[Phone]\n"
                    + "						  ,s.[Name] as sn\n"
                    + "                      FROM [Order] o INNER JOIN [Order_Detail] od ON o.[OrderID] = od.[OrderID]\n"
                    + "                    				 INNER JOIN [Product] p ON od.[ProductID] = p.[ProductID]\n"
                    + "                    				 INNER JOIN [User] u ON p.[Author] = u.[UserID] \n"
                    + "									 INNER JOIN [Setting] s ON s.Setting_ID=p.CategoryID WHERE o.[OrderID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderDetail o = new OrderDetail();
                o.setOrderID(rs.getInt("OrderID"));
                o.setQuantity(rs.getInt("Quantity"));
                o.setPrice(rs.getDouble("Price_Order"));
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                User u = new User();
                u.setUserID(rs.getInt("Author"));
                u.setName(rs.getString("Name"));
                u.setEmail(rs.getString("Email"));
                u.setPhone(rs.getString("Phone"));
                p.setAuthor(u);
                p.setTitle(rs.getString("Title"));
                Setting s = new Setting();
                s.setSettingID(rs.getInt("CategoryID"));
                s.setStatus(rs.getBoolean("Status"));
                s.setName(rs.getString("sn"));
                p.setCategory(s);
                p.setPrice(rs.getDouble("Price"));
                p.setSummary(rs.getString("Summary"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setCreateAt(rs.getDate("Created_At"));
                p.setUpdateAt(rs.getDate("Update_At"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setView(rs.getInt("View"));
                o.setProduct(p);
                products.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public Order getOrderInformation(int orderID) {
        Order o = new Order();
        try {
            String sql = "SELECT o.[OrderID]\n"
                    + "                      ,o.[CustomerID]\n"
                    + "                      ,o.[Order_Date]\n"
                    + "                      ,o.[Total_Bill]\n"
                    + "                      ,o.[StatusID]\n"
                    + "                      ,o.[Note]\n"
                    + "                      ,o.[Order_Address]\n"
                    + "                      ,o.Receiver_Name\n"
                    + "			     ,o.Receiver_Phone"
                    + "                      ,u.[UserID]\n"
                    + "				,u.[Phone]\n"
                    + "				,u.[Name]\n"
                    + "				,u.[Gender]\n"
                    + "				,u.[Password]\n"
                    + "				,u.[Email]\n"
                    + "				,u.[Address]\n"
                    + "				,u.[RoleID]\n"
                    + "				,u.[Registered_At]\n"
                    + "				,u.[Last_Login]\n"
                    + "				,u.[Avatar]\n"
                    + "				,u.[DOB]\n"
                    + "                    FROM [Order] o INNER JOIN [User] u on o.[CustomerID] = u.[UserID] WHERE o.[OrderID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                o.setOrderID(rs.getInt("OrderID"));
                User s = new User();
                s.setUserID(rs.getInt("UserID"));
                s.setName(rs.getString("Receiver_Name"));
                s.setEmail(rs.getString("Email"));
                s.setPassword(rs.getString("Password"));
                s.setGender(rs.getBoolean("Gender"));
                s.setPhone(rs.getString("Receiver_Phone"));
                s.setAvatar(rs.getString("Avatar"));
                s.setAddress(rs.getString("Order_Address"));
                s.setDob(rs.getDate("DOB"));
                o.setCusID(s);
                o.setOrderDate(rs.getDate("Order_Date"));
                o.setTotalBill(rs.getDouble(0));
                o.setOrderAddress(rs.getString("Order_Address"));
                Setting st = new Setting();
                st.setSettingID(rs.getInt("StatusID"));
                o.setStatus(st);
                o.setNote(rs.getString("Note"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return o;
    }

    public Order getOrderBriefInfo(int orderID) {
        Order o = new Order();
        try {
            String sql = "SELECT o.[OrderID]\n"
                    + "                                          ,o.[CustomerID]\n"
                    + "                                         ,o.[Order_Date]\n"
                    + "                                         ,o.[Total_Bill]\n"
                    + "                                         ,o.[StatusID]\n"
                    + "						,s.[Name]\n"
                    + "                                         ,o.[Note]\n"
                    + "                                         ,o.[Order_Address]\n"
                    + "                                         ,o.Receiver_Name\n"
                    + "                    		        ,o.Receiver_Phone\n"
                    + "                                         ,u.[UserID]\n"
                    + "                    			,u.[Phone]\n"
                    + "                    			,u.[Name]\n"
                    + "                    			,u.[Gender]\n"
                    + "                    			,u.[Password]\n"
                    + "                    			,u.[Email]\n"
                    + "                    			,u.[Address]\n"
                    + "                    			,u.[RoleID]\n"
                    + "                    			,u.[Registered_At]\n"
                    + "                    			,u.[Last_Login]\n"
                    + "                    			,u.[Avatar]\n"
                    + "                    			,u.[DOB]\n"
                    + "                                       FROM [Order] o \n"
                    + "					 INNER JOIN [User] u on o.[CustomerID] = u.[UserID] \n"
                    + "					 INNER JOIN Setting s on o.StatusID = s.Setting_ID\n"
                    + "				         WHERE o.[OrderID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                o.setOrderID(rs.getInt("OrderID"));
                User s = new User();
                s.setUserID(rs.getInt("UserID"));
                s.setName(rs.getString("Receiver_Name"));
                s.setEmail(rs.getString("Email"));
                s.setPassword(rs.getString("Password"));
                s.setGender(rs.getBoolean("Gender"));
                s.setPhone(rs.getString("Receiver_Phone"));
                s.setAvatar(rs.getString("Avatar"));
                s.setAddress(rs.getString("Order_Address"));
                s.setDob(rs.getDate("DOB"));
                o.setCusID(s);
                o.setOrderDate(rs.getDate("Order_Date"));
                o.setReceive(rs.getString("Receiver_Name"));
                o.setOrderAddress(rs.getString("Order_Address"));
                o.setTotalBill(rs.getDouble("Total_Bill"));
                Setting st = new Setting();
                st.setSettingID(rs.getInt("StatusID"));
                st.setName(rs.getString("Name"));
                o.setStatus(st);
                o.setNote(rs.getString("Note"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return o;
    }

    public void deleteOrder(int orderID) {
        try {
            String sql = "DELETE FROM [Order] \n"
                    + "      WHERE OrderID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteOrderDetail(int orderID) {
        try {
            String sql = "DELETE FROM [Order_Detail] \n"
                    + "      WHERE OrderID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getTotalPage(int uid) {
        int totalPage = 0;
        int totalOrder = 0;
        try {
            String sql = "SELECT [OrderID]\n"
                    + "  FROM [Order] WHERE [CustomerID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                totalOrder++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (totalOrder <= 5) {
            totalPage = 1;
        } else {
            totalPage = (int) totalOrder / 5;
        }
        return totalPage + 1;
    }

    public Boolean submitCartContact(int cartId, Receiver receiver, int user) {
        Boolean check = false;
        try {
            connection.setAutoCommit(false);
            CartDBContext cartDB = new CartDBContext();
            ArrayList<Integer> listShopId = cartDB.getAuthorProductInCartDetail(cartId);
            for (Integer listS : listShopId) {
                ArrayList<Product> listProductByAuthor = cartDB.getProductByAuthorInCart(cartId, listS);
                double totalBill = 0;
                for (Product product : listProductByAuthor) {
                    totalBill = totalBill + product.getPrice() * ((100 - product.getDiscount()) / 100) * product.getQuantity();
                }
                String createOrder = "INSERT INTO [dbo].[Order]\n"
                        + "           ([CustomerID]\n"
                        + "           ,[Order_Date]\n"
                        + "           ,[Total_Bill]\n"
                        + "           ,[StatusID]\n"
                        + "           ,[Note]\n"
                        + "           ,[Order_Address]\n"
                        + "           ,[Receiver_Name]\n"
                        + "           ,[Receiver_Phone])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,getDate()\n"
                        + "           ,?\n"
                        + "           ,15\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?)";
                PreparedStatement stm = connection.prepareStatement(createOrder);
                stm.setInt(1, user);
                stm.setDouble(2, totalBill);
                stm.setString(3, receiver.getNote());
                stm.setString(4, receiver.getAddress());
                stm.setString(5, receiver.getName());
                stm.setString(6, receiver.getPhone());
                stm.executeUpdate();

                //query to get Order_ID
                int orderID = 0;
                String sql_get_id = "Select @@Identity as oId";
                PreparedStatement stm_get_id = connection.prepareStatement(sql_get_id);
                ResultSet rs = stm_get_id.executeQuery();
                if (rs.next()) {
                    orderID = rs.getInt("oId");
                }

                for (Product product : listProductByAuthor) {
                    //add order detail
                    String addOrderDetail = "INSERT INTO [dbo].[Order_Detail]\n"
                            + "           ([OrderID]\n"
                            + "           ,[ProductID]\n"
                            + "           ,[Quantity]\n"
                            + "           ,[Price_Order])\n"
                            + "     VALUES\n"
                            + "           (?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?)";
                    PreparedStatement stm_insert_orderDetail = connection.prepareStatement(addOrderDetail);
                    stm_insert_orderDetail.setInt(1, orderID);
                    stm_insert_orderDetail.setInt(2, product.getProductID());
                    stm_insert_orderDetail.setInt(3, product.getQuantity());
                    stm_insert_orderDetail.setDouble(4, product.getPrice() * ((100 - product.getDiscount()) / 100) * product.getQuantity());
                    stm_insert_orderDetail.executeUpdate();
                }
            }
            connection.commit();
            check = true;
        } catch (Exception e) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, e);
            try {
                connection.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return check;
    }

    public ArrayList<Order> listallorder() {
        ArrayList<Order> order = new ArrayList<>();
        String sql = "SELECT o.[OrderID]\n"
                + "                      ,[CustomerID]\n"
                + "                      ,[Order_Date]\n"
                + "                      ,[Total_Bill]\n"
                + "                      ,[StatusID]\n"
                + "                      ,[Note]\n"
                + "                      ,[Order_Address]\n"
                + "                     ,[Receiver_Name]\n"
                + "                      ,[Receiver_Phone]\n"
                + "                	  ,s.[Name]\n"
                + "                	  ,s.Setting_ID\n"
                + "                 FROM [dbo].[Order] o \n"
                + "				  inner join Setting s\n"
                + "                  on o.StatusID = s.Setting_ID\n"
                + "				  inner join [Order_Detail] od\n"
                + "				  on od.OrderID = o.OrderID\n"
                + "				  inner join [Product] p \n"
                + "				  on p.ProductID = od.ProductID";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrderID(rs.getInt("OrderID"));
                o.setOrderDate(rs.getDate("Order_Date"));
                o.setTotalBill(rs.getInt("Total_Bill"));
                o.setReceive(rs.getString("Receiver_Name"));
                Setting s = new Setting();
                s.setName(rs.getString("Name"));
                s.setSettingID(rs.getInt("Setting_ID"));
                o.setStatus(s);
                order.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return order;
    }

    public boolean changeStatusOrder(int status, int oid) {
        try {
            String sql = "UPDATE [dbo].[Order]\n"
                    + "   SET [StatusID] = ?\n"
                    + " WHERE OrderID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setInt(2, oid);
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public static void main(String[] args) {
        OrderDBContext orderDB = new OrderDBContext();
        System.out.println(orderDB.getOrderBriefInfo(1024));
//        System.out.println(orderDB.listallorder());
    }
}
