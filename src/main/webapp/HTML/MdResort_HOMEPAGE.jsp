<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Retrieve the session object
    String user = (session != null) ? (String) session.getAttribute("user") : null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MD Resort</title>
    <link rel="stylesheet" href="style1.css">
</head>
<body>
    <!-- Header -->
    <header>
        <div class="logo">
            <a href="MdResort_HOMEPAGE.jsp"><img src="MdResort_logo.png" alt="MD Resort Logo"></a>
            <a href="MdResort_HOMEPAGE.jsp" style="color: black; text-decoration: none;">MD Resort</a>
        </div>

        <nav>
            <ul>
                <li><a href="MdResort_HOMEPAGE.jsp">HOME</a></li>
                <li class="dropdown">
                    <a href="MdResort_ROOM.html">ROOM</a>
                    <!-- Room Dropdown -->
                    <div class="dropdown-room">
                        <a href="MdResort_ROOM_FAMILY.html">FAMILY</a>
                        <a href="MdResort_ROOM_CABIN.html">CABIN</a>
                        <a href="MdResort_ROOM_WOOD.html">WOOD</a>
                    </div>
                </li>
                <li><a href="MdResort_FACILITIES.html">FACILITIES</a></li>
                <% if (user != null) { %>
                    <!-- Dropdown Profile Icon -->
                    <li>
                        <div class="profile-dropdown">
                            <img src="profile-icon.png" style="width: 30px; height: auto;" alt="MD Profile Icon">
                            <div class="profile-dropdown-content">
                                <a href="MdResort_PROFILE.html">Profile</a>
                                <a href="MdResort_BOOKING.html">Booking</a>
                                <a href="MdResort_SETTING.html">Setting</a>
                                <a href="LogoutServlet" class="logout-btn">Logout</a>
                            </div>
                        </div>
                    </li>
                <% } else { %>
                    <!-- Display Sign Up and Log In Buttons for Guest -->
                    <li><a href="MdResort_SIGNUP.html" class="btn">Sign Up</a></li>
                    <li><a href="MdResort_LOGIN.html" class="btn">Log In</a></li>
                <% } %>
            </ul>
        </nav>
    </header>

    <!-- Hero Image -->
    <div class="hero-image">
        <img src="MdResort_backgroundimg.png" alt="Resort Background" style="width: 100%;">
    </div>

    <!-- About Section -->
    <div class="content">
        <h2>How We Started?</h2>
        <div class="about-section">
            <div class="image-section">
                <img src="MdResort_logo.png" alt="Resort Image">
            </div>
            <div class="text-section">
                <p>MD Resort, founded by Nadirah Binti Abd Rahman in 2021, offers a peaceful retreat on Melaka's coastline. Initially a small project with eight rooms, it has grown into a thriving business with sixteen quaint rooms. MD Resort provides comfortable accommodations and flexible event rooms for various events. The resort offers amenities like an on-site restaurant, surau, and beachside BBQ. Nightly rates range from RM130 to RM230, and the staff maintains cleanliness. MD Resort is committed to providing individualized service and maintaining cleanliness.</p>
            </div>
        </div>
    </div>

    <!-- Features Section -->
    <section class="features">
        <h2>Why Choose Us?</h2>
        <div class="feature-container">
            <div class="feature">
                <img src="nature.png" alt="Nature Icon">
                <h3>Live Amidst Nature</h3>
                <p>Feel and experience nature in its fullest glory to refresh yourself.</p>
            </div>
            <div class="feature">
                <img src="adventure.png" alt="Adventure Icon">
                <h3>Adventure and Activities</h3>
                <p>Explore the natural beauty of Pantai with our guided tours.</p>
            </div>
            <div class="feature">
                <img src="family.png" alt="Family Icon">
                <h3>Family Friendly</h3>
                <p>The calm and comfortable environment will make your family feel at home.</p>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="footer-container">
            <!-- Logo -->
            <div class="footer-logo">
                <img src="MdResort_logo.png" alt="Logo">
            </div>

            <!-- Social Media Icons -->
            <div class="social-icons">
                <a href="https://www.facebook.com/mddiahresort/"><img src="facebook_icon.png" alt="Facebook"></a>
                <a href="https://www.instagram.com/mddiahresort.co/"><img src="instagram_icon.png" alt="Instagram"></a>
                <a href="https://api.whatsapp.com/send?phone=601114753100&text=Hi%20is%20there%20available%20room%20at%20MD%20resort%3F"><img src="whatsapp_icon.png" alt="WhatsApp"></a>
            </div>

            <!-- Navigation Links -->
            <ul class="footer-links">
                <li><a href="MdResort_HOMEPAGE_after_LOGIN.html">Home</a></li>
                <li><a href="MdResort_ROOM_after_LOGIN.html">Room</a></li>
                <li><a href="MdResort_FACILITIES_after_LOGIN.html">Facilities</a></li>
            </ul>
        </div>
    </footer>
</body>
</html>
