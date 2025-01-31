<!DOCTYPE html>
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
            border-rad	ius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: auto;
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
        .section {
            margin-bottom: 20px;
        }
        .section h3 {
            margin: 10px 0;
        }
        select, input[type="radio"], input[type="checkbox"] {
            margin-bottom: 10px;
        }
        .list-container {
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
            padding-top: 50px;
        }
        .modal-content {
            background-color: white;
            margin: 5% auto;
            padding: 20px;
            border-radius: 8px;
            width: 80%;
            max-width: 500px;
        }
        .modal button {
            margin-top: 20px;
        }
        .table-container {
            margin-top: 20px;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
        }
        .table td, .table th {
            padding: 8px;
            border: 1px solid #ddd;
        }
        .table th {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
<form id="orderForm" action="save" method="post">
    <div class="container">
        <h2>Order Sales</h2>

        <!-- Select Group -->
        <div class="section">
            <h3>Select Group</h3>
            <input type="radio" id="customerRadio" name="customer" onclick="openModal('customer')" />
            <label for="customerRadio">Customer</label>
            <input type="radio" id="channelRadio" name="channel" onclick="openModal('channel')" />
            <label for="channelRadio">Channel</label>
        </div>

        <!-- Select Route -->
        <div class="section">
            <label for="routeSelect">Select route</label>
            <select id="routeSelect" name="route" required>
                <option value="" disabled selected>Select route</option>
                <option value="gachibowli">Gachibowli</option>
                <option value="nanakramguda">Nanakramguda</option>
                <option value="hitechcity">Hitechcity</option>
            </select>
        </div>

        <!-- List of Items Button -->
        <div class="section">
            <h3>Select Items</h3>
            <button type="button" onclick="openModal('items')">Select Items</button>
        </div>

      <button type="submit" onclick="submitOrder(event)">Submit Order</button>
    </div>
</form>

<!-- Modal for Customer List -->
<div id="customerModal" class="modal">
    <div class="modal-content">
        <h3>Select Customer</h3>
        <div class="list">
            <div class="list-item">
                <input type="radio" name="customer" id="customer1" />
                <label for="customer1"> 0121: John Doe</label>
            </div>
            <div class="list-item">
                <input type="radio" name="customer" id="customer2" />
                <label for="customer2">0122: Jane Smith</label>
            </div>
            <div class="list-item">
                <input type="radio" name="customer" id="customer3" />
                <label for="customer3">0123: Mark Lee</label>
            </div>
            <div class="list-item">
                <input type="radio" name="customer" id="customer4" />
                <label for="customer4">0124: Alice Brown</label>
            </div>
        </div>
        <button onclick="confirmSelection('customer')">Confirm Customer</button>
        <button onclick="closeModal('customer')">Close</button>
    </div>
</div>

<!-- Modal for Channel List -->
<div id="channelModal" class="modal">
    <div class="modal-content">
        <h3>Select Channel</h3>
        <div class="list">
            <div class="list-item">
                <input type="radio" name="channel" id="channel1" />
                <label for="channel1"> 0123: North</label>
            </div>
            <div class="list-item">
                <input type="radio" name="channel" id="channel2" />
                <label for="channel2">2023: South</label>
            </div>
            <div class="list-item">
                <input type="radio" name="channel" id="channel3" />
                <label for="channel3">0233: East</label>
            </div>
            <div class="list-item">
                <input type="radio" name="channel" id="channel4" />
                <label for="channel4">02334: West</label>
            </div>
        </div>
        <button onclick="confirmSelection('channel')">Confirm Channel</button>
        <button onclick="closeModal('channel')">Close</button>
    </div>
</div>

<!-- Modal for Item Selection (Single Table with Checkboxes on Both Sides) -->
<div id="itemsModal" class="modal">
    <div class="modal-content">
        <h3>Select Items</h3>
        <div class="table-container">
            <table class="table">
                <thead>
                    <tr>
                        <th>Select</th>
                        <th>Item ID</th>
                        <th>Item Name</th>
                        <th>Confirm</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" id="item1" onclick="toggleItemSelection(this, 'item1')" name="items"></td>
                        <td>1</td>
                        <td>Milk</td>
                        <td><input type="checkbox" onclick="confirmItemSelection(this, 'item1')"></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="item2" onclick="toggleItemSelection(this, 'item2')"></td>
                        <td>2</td>
                        <td>Rice</td>
                        <td><input type="checkbox" onclick="confirmItemSelection(this, 'item2')"></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="item3" onclick="toggleItemSelection(this, 'item3')"></td>
                        <td>3</td>
                        <td>Chips</td>
                        <td><input type="checkbox" onclick="confirmItemSelection(this, 'item3')"></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="item4" onclick="toggleItemSelection(this, 'item4')"></td>
                        <td>4</td>
                        <td>Cloths</td>
                        <td><input type="checkbox" onclick="confirmItemSelection(this, 'item4')"></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <button onclick="confirmSelection('items')">Confirm Items</button>
        <button onclick="closeModal('items')">Close</button>
    </div>
</div>

<script>
    function openModal(type) {
        if (type === 'customer') {
            document.getElementById('customerModal').style.display = 'block';
        } else if (type === 'channel') {
            document.getElementById('channelModal').style.display = 'block';
        } else if (type === 'items') {
            document.getElementById('itemsModal').style.display = 'block';
        }
    }

    function closeModal(type) {
        if (type === 'customer') {
            document.getElementById('customerModal').style.display = 'none';
        } else if (type === 'channel') {
            document.getElementById('channelModal').style.display = 'none';
        } else if (type === 'items') {
            document.getElementById('itemsModal').style.display = 'none';
        }
    }

    function toggleItemSelection(checkbox, itemId) {
        var row = checkbox.closest("tr");
        if (checkbox.checked) {
            row.style.backgroundColor = "#d3f8d3"; // Highlight selected item
        } else {
            row.style.backgroundColor = "";
        }
    }

    function confirmItemSelection(checkbox, itemId) {
        var row = checkbox.closest("tr");
        if (checkbox.checked) {
            row.style.backgroundColor = "#d3f8d3"; // Highlight confirmed item
        } else {
            row.style.backgroundColor = "";
        }
    }

    function confirmSelection(type) {
        if (type === 'customer') {
            const selectedCustomer = document.querySelector('input[name="customer"]:checked');
            if (selectedCustomer) {
                alert('Customer confirmed: ' + selectedCustomer.nextElementSibling.textContent);
                closeModal('customer');
            } else {
                alert('Please select a customer');
            }
        } else if (type === 'channel') {
            const selectedChannel = document.querySelector('input[name="channel"]:checked');
            if (selectedChannel) {
                alert('Channel confirmed: ' + selectedChannel.nextElementSibling.textContent);
                closeModal('channel');
            } else {
                alert('Please select a channel');
            }
        } else if (type === 'items') {
            const selectedItems = [];
            document.querySelectorAll('#itemsModal input[type="checkbox"]:checked').forEach(item => {
                selectedItems.push(item.closest("tr").cells[2].textContent);
            });
            if (selectedItems.length > 0) {
                alert('Items confirmed: ' + selectedItems.join(', '));
                closeModal('items');
            } else {
                alert('Please select items');
            }
        }
    }

  /*  function submitOrder(event) {
        event.preventDefault();  // Prevent form from submitting

        const customer = document.querySelector('input[name="customer"]:checked');
        const channel = document.querySelector('input[name="channel"]:checked');
        const route = document.getElementById('routeSelect').value;
        const selectedItems = [];
        document.querySelectorAll('#itemsModal input[type="checkbox"]:checked').forEach(item => {
            selectedItems.push(item.closest("tr").cells[2].textContent);
        });

        if (customer && channel && selectedItems.length > 0) {
            const orderData = {
                customer: customer.nextElementSibling.textContent,
                channel: channel.nextElementSibling.textContent,
                route: route,
                items: selectedItems
            };
            alert('Order Submitted: ' + JSON.stringify(orderData));
        } else {
            alert('Please complete all selections before submitting');
        }
    } */ 
</script>
</body>
</html>
