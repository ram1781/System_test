<!DOCTYPE html>
<%@page import="System_test.dto.Orders" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Sales</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        .view-btn {
            background-color: green;
            color: white;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        .view-btn:hover {
            background-color: darkgreen;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Order Sales</h2>
        <a href="add_item.jsp"><button>ADD</button></a>
        <% Orders o=(Orders)request.getAttribute("s"); %>
        <table>
            <thead>
                <tr>
                    <th><input type="checkbox" onclick="toggleAll(this)"></th>
                    <th>Customer</th>
                    <th>Route</th>
                    <th>Sale</th>
                    <th>Item quantity</th>
                    <th>Must sell</th>
                    <th>Action</th>
                </tr>
                <tr>
                
                <td><input type="checkbox"></td>
                                <td>null</td>
                <%if (o!=null){ %>
                 <td><%=o.getRoute()%></td>
                 <%} %>
                  <td>#Retail</td>
                   <td>null</td>
                    <td>null</td>
                    <td><button >view</button></td>
            
                </tr>
            </thead>
           <tbody id="orderTableBody">
             
              
            </tbody> 
        </table>
    </div>

    <script>
        function toggleAll(source) {
            const checkboxes = document.querySelectorAll("input[type='checkbox']");
            checkboxes.forEach(checkbox => {
                checkbox.checked = source.checked;
            });
        }

        function viewDetails(row) {
            alert("Viewing details for " + row.cells[1].textContent);
        }
    </script>
</body>
</html>

