<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - MD Resort</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f5f5f5;
        }

        .profile-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        .field {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .field label {
            font-size: 16px;
            color: #333;
        }

        .field input {
            width: 70%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
        }

        .field .edit-icon {
            font-size: 14px;
            color: #888;
            cursor: pointer;
            margin-left: 10px;
        }

        .delete-button {
            background-color: black;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            margin: 20px auto 0;
            width: 100%;
            text-align: center;
        }

        .delete-button:hover {
            background-color: #444;
        }

        .popup-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
            justify-content: center;
            align-items: center;
        }

        .popup {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            width: 300px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .popup p {
            margin-bottom: 20px;
            font-size: 16px;
            color: #333;
        }

        .popup button {
            margin: 0 10px;
            padding: 10px 20px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .popup .confirm {
            background-color: green;
            color: white;
        }

        .popup .cancel {
            background-color: red;
            color: white;
        }

    </style>
</head>
<body>
    <div class="profile-container">
        <h1>Profile</h1>

        <div class="field">
            <label for="name">Name:</label>
            <div>
                <input type="text" id="name" value="Siti Saleha" readonly>
                <span class="edit-icon">&#9998;</span>
            </div>
        </div>

        <div class="field">
            <label for="email">Email:</label>
            <div>
                <input type="email" id="email" value="saleha@gmail.com" readonly>
                <span class="edit-icon">&#9998;</span>
            </div>
        </div>

        <div class="field">
            <label for="phone">Phone Number:</label>
            <div>
                <input type="text" id="phone" value="0286338292" readonly>
                <span class="edit-icon">&#9998;</span>
            </div>
        </div>

        <div class="field">
            <label for="password">Password:</label>
            <div>
                <input type="password" id="password" value="xxxxxxxxx" readonly>
                <span class="edit-icon">&#9998;</span>
            </div>
        </div>

        <button class="delete-button" onclick="showPopup()">Delete Account</button>
    </div>

    <div class="popup-overlay" id="popupOverlay">
        <div class="popup">
            <p>Are you sure you want to delete your account?</p>
            <button class="confirm" onclick="deleteAccount()">Yes</button>
            <button class="cancel" onclick="hidePopup()">No</button>
        </div>
    </div>

    <script>
        function showPopup() {
            document.getElementById('popupOverlay').style.display = 'flex';
        }

        function hidePopup() {
            document.getElementById('popupOverlay').style.display = 'none';
        }

        function deleteAccount() {
            alert('Your account has been successfully deleted.');
            hidePopup();
        }
    </script>
</body>
</html>