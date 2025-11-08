<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SafarSathi - Explore the World with Us</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="container">
            <div class="logo">
                <i class="fas fa-plane-departure"></i>
                <h1>SafarSathi</h1>
                <p style="font-size: 14px; font-style: italic; margin-left: 10px; display: inline-block;">हर सफर का साथी SafarSathi</p>
            </div>
            <nav>
                <ul class="nav-links">
                    <li><a href="#home"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="#destinations"><i class="fas fa-map-marked-alt"></i> Destinations</a></li>
                    <li><a href="#packages"><i class="fas fa-suitcase"></i> Packages</a></li>
                    <li><a href="#contact"><i class="fas fa-envelope"></i> Contact</a></li>
                </ul>
                <div class="hamburger">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </nav>
        </div>
    </header>

    <!-- Hero Section -->
    <section id="home" class="hero">
        <div class="hero-overlay"></div>
        <div class="hero-content">
            <h2 class="hero-title">🌍 Explore the World with Us</h2>
            <p class="hero-subtitle">Create unforgettable memories with our curated travel experiences</p>
            <p class="hero-description">Whether you're planning a family vacation, a romantic getaway, or a solo adventure, SafarSathi offers tailor-made packages to suit your style. With a passion for exploration and commitment to comfort, we turn your travel dreams into reality.</p>
            <a href="#packages" class="btn-primary">
                <i class="fas fa-compass"></i> Explore Packages
            </a>
        </div>
        <div class="hero-scroll">
            <i class="fas fa-chevron-down"></i>
        </div>
    </section>

    <!-- Why Choose Us -->
    <section class="why-choose">
        <div class="container">
            <h2 class="section-title">✨ Why Choose SafarSathi?</h2>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                    <h3>Best Prices</h3>
                    <p>Competitive rates with no hidden charges. Get the best value for your money.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-headset"></i>
                    </div>
                    <h3>24/7 Support</h3>
                    <p>Our team is always here to help, anytime, anywhere during your journey.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <h3>Safe & Secure</h3>
                    <p>Your safety is our priority. Travel with complete peace of mind.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <h3>Top Rated</h3>
                    <p>Trusted by thousands of happy travelers. 4.8★ average rating.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Destinations Section -->
    <section id="destinations" class="destinations">
        <div class="container">
            <h2 class="section-title">✈️ Top Destinations</h2>
            <p class="section-subtitle">Discover the most beautiful places around the world</p>
            <div class="destination-container">
                <div class="destination-card" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.5)), url('https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800');">
                    <div class="card-content">
                        <div class="card-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <h3>Paris, France</h3>
                        <p>City of Love & Lights</p>
                        <div class="destination-price">From $899</div>
                        <a href="#packages" class="card-btn">View Packages</a>
                    </div>
                </div>
                <div class="destination-card" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.5)), url('https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800');">
                    <div class="card-content">
                        <div class="card-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <h3>Bali, Indonesia</h3>
                        <p>Tropical Paradise</p>
                        <div class="destination-price">From $699</div>
                        <a href="#packages" class="card-btn">View Packages</a>
                    </div>
                </div>
                <div class="destination-card" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.5)), url('https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=800');">
                    <div class="card-content">
                        <div class="card-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <h3>London, UK</h3>
                        <p>Royal & Historic</p>
                        <div class="destination-price">From $1099</div>
                        <a href="#packages" class="card-btn">View Packages</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Packages Section -->
    <section id="packages" class="packages">
        <div class="container">
            <h2 class="section-title">🎒 Our Travel Packages</h2>
            <p class="section-subtitle">Handpicked packages designed for unforgettable experiences</p>

            <!-- Paris Packages -->
            <div class="destination-packages">
                <h3 class="destination-title">
                    <i class="fas fa-landmark"></i> Paris Packages
                </h3>
                <div class="package-container">
                    <!-- Essential Package -->
                    <div class="package-card">
                        <div class="package-badge essential">Essential</div>
                        <div class="package-header">
                            <h4>Paris Essential</h4>
                            <div class="price">$899</div>
                            <div class="duration"><i class="far fa-calendar"></i> 4 Days / 3 Nights</div>
                        </div>
                        <ul class="package-features">
                            <li><i class="fas fa-check"></i> 3-Star Hotel in City Center</li>
                            <li><i class="fas fa-check"></i> Eiffel Tower Visit</li>
                            <li><i class="fas fa-check"></i> Seine River Cruise</li>
                            <li><i class="fas fa-check"></i> Breakfast Included</li>
                            <li class="not-included"><i class="fas fa-times"></i> Louvre Museum Tickets</li>
                            <li class="not-included"><i class="fas fa-times"></i> Airport Transfer</li>
                        </ul>
                        <button class="btn-book" data-destination="Paris" data-package="Essential" data-price="899">
                            <i class="fas fa-ticket-alt"></i> Book Now
                        </button>
                    </div>

                    <!-- Romance Package -->
                    <div class="package-card popular">
                        <div class="package-badge popular">Most Popular</div>
                        <div class="package-header">
                            <h4>Paris Romance</h4>
                            <div class="price">$1299</div>
                            <div class="duration"><i class="far fa-calendar"></i> 6 Days / 5 Nights</div>
                        </div>
                        <ul class="package-features">
                            <li><i class="fas fa-check"></i> 4-Star Boutique Hotel</li>
                            <li><i class="fas fa-check"></i> Eiffel Tower & Louvre</li>
                            <li><i class="fas fa-check"></i> Romantic Dinner Cruise</li>
                            <li><i class="fas fa-check"></i> All Breakfasts & 2 Dinners</li>
                            <li><i class="fas fa-check"></i> Airport Transfer</li>
                            <li><i class="fas fa-check"></i> Versailles Day Trip</li>
                        </ul>
                        <button class="btn-book" data-destination="Paris" data-package="Romance" data-price="1299">
                            <i class="fas fa-ticket-alt"></i> Book Now
                        </button>
                    </div>

                    <!-- Luxury Package -->
                    <div class="package-card">
                        <div class="package-badge luxury">Luxury</div>
                        <div class="package-header">
                            <h4>Paris Luxury</h4>
                            <div class="price">$1999</div>
                            <div class="duration"><i class="far fa-calendar"></i> 7 Days / 6 Nights</div>
                        </div>
                        <ul class="package-features">
                            <li><i class="fas fa-check"></i> 5-Star Luxury Hotel</li>
                            <li><i class="fas fa-check"></i> Private Guided Tours</li>
                            <li><i class="fas fa-check"></i> Fine Dining Experiences</li>
                            <li><i class="fas fa-check"></i> Luxury Car Transfer</li>
                            <li><i class="fas fa-check"></i> All Meals Included</li>
                            <li><i class="fas fa-check"></i> Champagne & Wine Tours</li>
                        </ul>
                        <button class="btn-book" data-destination="Paris" data-package="Luxury" data-price="1999">
                            <i class="fas fa-ticket-alt"></i> Book Now
                        </button>
                    </div>
                </div>
            </div>

            <!-- Bali Packages -->
            <div class="destination-packages">
                <h3 class="destination-title">
                    <i class="fas fa-umbrella-beach"></i> Bali Packages
                </h3>
                <div class="package-container">
                    <!-- Beach Escape -->
                    <div class="package-card">
                        <div class="package-badge essential">Beach Escape</div>
                        <div class="package-header">
                            <h4>Bali Beach Escape</h4>
                            <div class="price">$699</div>
                            <div class="duration"><i class="far fa-calendar"></i> 5 Days / 4 Nights</div>
                        </div>
                        <ul class="package-features">
                            <li><i class="fas fa-check"></i> Beachfront Villa</li>
                            <li><i class="fas fa-check"></i> Surfing Lessons</li>
                            <li><i class="fas fa-check"></i> Temple Visits</li>
                            <li><i class="fas fa-check"></i> Breakfast Included</li>
                            <li class="not-included"><i class="fas fa-times"></i> Spa Treatments</li>
                            <li class="not-included"><i class="fas fa-times"></i> Private Driver</li>
                        </ul>
                        <button class="btn-book" data-destination="Bali" data-package="Beach Escape" data-price="699">
                            <i class="fas fa-ticket-alt"></i> Book Now
                        </button>
                    </div>

                    <!-- Cultural -->
                    <div class="package-card popular">
                        <div class="package-badge popular">Best Value</div>
                        <div class="package-header">
                            <h4>Bali Cultural</h4>
                            <div class="price">$999</div>
                            <div class="duration"><i class="far fa-calendar"></i> 7 Days / 6 Nights</div>
                        </div>
                        <ul class="package-features">
                            <li><i class="fas fa-check"></i> Luxury Resort Stay</li>
                            <li><i class="fas fa-check"></i> Cultural Temple Tours</li>
                            <li><i class="fas fa-check"></i> Traditional Spa Day</li>
                            <li><i class="fas fa-check"></i> All Breakfasts Included</li>
                            <li><i class="fas fa-check"></i> Private Driver 6 Hours/Day</li>
                            <li><i class="fas fa-check"></i> Rice Terrace Visit</li>
                        </ul>
                        <button class="btn-book" data-destination="Bali" data-package="Cultural" data-price="999">
                            <i class="fas fa-ticket-alt"></i> Book Now
                        </button>
                    </div>

                    <!-- Luxury Retreat -->
                    <div class="package-card">
                        <div class="package-badge luxury">Luxury</div>
                        <div class="package-header">
                            <h4>Bali Luxury Retreat</h4>
                            <div class="price">$1599</div>
                            <div class="duration"><i class="far fa-calendar"></i> 8 Days / 7 Nights</div>
                        </div>
                        <ul class="package-features">
                            <li><i class="fas fa-check"></i> Private Pool Villa</li>
                            <li><i class="fas fa-check"></i> Personal Chef & Butler</li>
                            <li><i class="fas fa-check"></i> Luxury Spa Treatments</li>
                            <li><i class="fas fa-check"></i> Private Car & Driver</li>
                            <li><i class="fas fa-check"></i> All Meals Included</li>
                            <li><i class="fas fa-check"></i> Island Hopping Tour</li>
                        </ul>
                        <button class="btn-book" data-destination="Bali" data-package="Luxury Retreat" data-price="1599">
                            <i class="fas fa-ticket-alt"></i> Book Now
                        </button>
                    </div>
                </div>
            </div>

            <!-- London Packages -->
            <div class="destination-packages">
                <h3 class="destination-title">
                    <i class="fas fa-crown"></i> London Packages
                </h3>
                <div class="package-container">
                    <!-- Explorer -->
                    <div class="package-card">
                        <div class="package-badge essential">Explorer</div>
                        <div class="package-header">
                            <h4>London Explorer</h4>
                            <div class="price">$1099</div>
                            <div class="duration"><i class="far fa-calendar"></i> 5 Days / 4 Nights</div>
                        </div>
                        <ul class="package-features">
                            <li><i class="fas fa-check"></i> 3-Star Central Hotel</li>
                            <li><i class="fas fa-check"></i> London Eye & Thames Cruise</li>
                            <li><i class="fas fa-check"></i> Buckingham Palace Tour</li>
                            <li><i class="fas fa-check"></i> Breakfast Included</li>
                            <li class="not-included"><i class="fas fa-times"></i> West End Show Tickets</li>
                            <li class="not-included"><i class="fas fa-times"></i> Airport Transfer</li>
                        </ul>
                        <button class="btn-book" data-destination="London" data-package="Explorer" data-price="1099">
                            <i class="fas fa-ticket-alt"></i> Book Now
                        </button>
                    </div>

                    <!-- Royal -->
                    <div class="package-card popular">
                        <div class="package-badge popular">Royal Choice</div>
                        <div class="package-header">
                            <h4>London Royal</h4>
                            <div class="price">$1699</div>
                            <div class="duration"><i class="far fa-calendar"></i> 7 Days / 6 Nights</div>
                        </div>
                        <ul class="package-features">
                            <li><i class="fas fa-check"></i> 4-Star Heritage Hotel</li>
                            <li><i class="fas fa-check"></i> Tower of London & Crown Jewels</li>
                            <li><i class="fas fa-check"></i> West End Theater Show</li>
                            <li><i class="fas fa-check"></i> Traditional Afternoon Tea</li>
                            <li><i class="fas fa-check"></i> Airport Transfer</li>
                            <li><i class="fas fa-check"></i> Stonehenge Day Trip</li>
                        </ul>
                        <button class="btn-book" data-destination="London" data-package="Royal" data-price="1699">
                            <i class="fas fa-ticket-alt"></i> Book Now
                        </button>
                    </div>

                    <!-- Premium -->
                    <div class="package-card">
                        <div class="package-badge luxury">Premium</div>
                        <div class="package-header">
                            <h4>London Premium</h4>
                            <div class="price">$2499</div>
                            <div class="duration"><i class="far fa-calendar"></i> 8 Days / 7 Nights</div>
                        </div>
                        <ul class="package-features">
                            <li><i class="fas fa-check"></i> 5-Star Luxury Hotel</li>
                            <li><i class="fas fa-check"></i> Private Royal Palaces Tour</li>
                            <li><i class="fas fa-check"></i> Michelin Star Dining</li>
                            <li><i class="fas fa-check"></i> Luxury Chauffeur Service</li>
                            <li><i class="fas fa-check"></i> All Meals & Experiences</li>
                            <li><i class="fas fa-check"></i> Cotswolds Countryside Tour</li>
                        </ul>
                        <button class="btn-book" data-destination="London" data-package="Premium" data-price="2499">
                            <i class="fas fa-ticket-alt"></i> Book Now
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Traveller's Gallery Section -->
    <section class="gallery">
        <div class="container">
            <h2 class="section-title">📸 Photo's From Travellers</h2>
            <p class="section-subtitle">Capturing unforgettable moments from our amazing travelers around the world</p>

            <div class="gallery-grid">
                <div class="gallery-item">
                    <img src="https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?w=800&q=80" alt="Mountain Adventure">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <i class="fas fa-mountain"></i>
                            <h4>Mountain Trek</h4>
                            <p>Himalayan Adventure</p>
                        </div>
                    </div>
                </div>

                <div class="gallery-item">
                    <img src="https://images.unsplash.com/photo-1530789253388-582c481c54b0?w=800&q=80" alt="Lake View">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <i class="fas fa-water"></i>
                            <h4>Scenic Beauty</h4>
                            <p>Alpine Lake</p>
                        </div>
                    </div>
                </div>

                <div class="gallery-item">
                    <img src="https://images.unsplash.com/photo-1488646953014-85cb44e25828?w=800&q=80" alt="City Explorer">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <i class="fas fa-city"></i>
                            <h4>City Vibes</h4>
                            <p>Urban Adventures</p>
                        </div>
                    </div>
                </div>

                <div class="gallery-item">
                    <img src="https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?w=800&q=80" alt="Beach Sunset">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <i class="fas fa-sun"></i>
                            <h4>Beach Sunset</h4>
                            <p>Coastal Paradise</p>
                        </div>
                    </div>
                </div>

                <div class="gallery-item">
                    <img src="https://images.unsplash.com/photo-1504609773096-104ff2c73ba4?w=800&q=80" alt="Hiking Trail">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <i class="fas fa-hiking"></i>
                            <h4>Trail Blazing</h4>
                            <p>Nature Walks</p>
                        </div>
                    </div>
                </div>

                <div class="gallery-item">
                    <img src="https://images.unsplash.com/photo-1539635278303-d4002c07eae3?w=800&q=80" alt="Cultural Tour">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <i class="fas fa-landmark"></i>
                            <h4>Cultural Journey</h4>
                            <p>Historical Sites</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Founders Section -->
    <section class="founders">
        <div class="container">
            <h2 class="section-title">👥 Meet Our Founders</h2>
            <p class="section-subtitle">The passionate team behind SafarSathi</p>

            <div class="founders-grid">
                <!-- Founder 1: Ved Shrimali -->
                <div class="founder-card">
                    <div class="founder-image">
                          <img src="<%= request.getContextPath() %>/photo/ved.jpg" alt="Ved Shrimali">
                        <div class="founder-badge">Co-Founder</div>
                    </div>
                    <div class="founder-info">
                        <h3>Ved Shrimali</h3>
                        <p class="founder-role"><i class="fas fa-briefcase"></i> Co-Founder & CEO</p>
                        <p class="founder-education">
                            <i class="fas fa-graduation-cap"></i>
                            3rd Year Student<br>
                            Pandit Deendayal Energy University
                        </p>
                        <p class="founder-bio">
                            Passionate about creating unforgettable travel experiences and connecting people with beautiful destinations around the world.
                        </p>
                        <div class="founder-social">
                            <a href="https://www.linkedin.com/in/ved-shrimali-73aa58285/" target="_blank" rel="noopener noreferrer">
                                <i class="fab fa-linkedin"></i> Connect on LinkedIn
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Founder 2: Kashish Thakor -->
                <div class="founder-card">
                    <div class="founder-image">
                        <img src="<%= request.getContextPath() %>/photo/kashish.jpg" alt="Kashish Thakor">
                        <div class="founder-badge">Co-Founder</div>
                    </div>
                    <div class="founder-info">
                        <h3>Kashish Thakor</h3>
                        <p class="founder-role"><i class="fas fa-briefcase"></i> Co-Founder & COO</p>
                        <p class="founder-education">
                            <i class="fas fa-graduation-cap"></i>
                            3rd Year Student<br>
                            Pandit Deendayal Energy University
                        </p>
                        <p class="founder-bio">
                            Dedicated to delivering exceptional customer service and innovative travel solutions that exceed expectations.
                        </p>
                        <div class="founder-social">
                            <a href="http://www.linkedin.com/in/kashish-thakor-b61302391" target="_blank" rel="noopener noreferrer">
                                <i class="fab fa-linkedin"></i> Connect on LinkedIn
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

 <!-- Contact Section -->
    <section id="contact" class="contact">
        <div class="container">
            <h2 class="section-title">📞 Get in Touch</h2>
            <p class="section-subtitle">Have questions? We are here to help!</p>
            <div class="contact-content">
                <div class="contact-info">
                    <h3>Contact Information</h3>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-map-marker-alt"></i></div>
                        <div><strong>Address</strong><p>123 Travel Street, Tourism City<br>New York, NY 12345</p></div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-phone"></i></div>
                        <div><strong>Phone</strong><p>(+91) 7359174906</p></div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-envelope"></i></div>
                        <div><strong>Email</strong><p>info@safarsathi.com</p></div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon"><i class="fas fa-clock"></i></div>
                        <div><strong>Working Hours</strong><p>Mon - Sat: 9:00 AM - 6:00 PM</p></div>
                    </div>
                </div>

                <form action="contact_process.jsp" method="POST" class="contact-form">
                    <h3>Send us a Message</h3>
                    <div class="form-group">
                        <label><i class="fas fa-user"></i> Your Name *</label>
                        <input type="text" name="name" placeholder="John Doe" required />
                    </div>
                    <div class="form-group">
                        <label><i class="fas fa-envelope"></i> Your Email *</label>
                        <input type="email" name="email" placeholder="john@example.com" required />
                    </div>
                    <div class="form-group">
                        <label><i class="fas fa-phone"></i> Phone Number</label>
                        <input type="tel" name="phone" placeholder="+91 1234567890" />
                    </div>
                    <div class="form-group">
                        <label><i class="fas fa-map-marked-alt"></i> Interested Destination</label>
                        <select name="destinationInterest" class="form-select">
                            <option value="">Select a destination</option>
                            <option value="Paris">Paris, France</option>
                            <option value="Bali">Bali, Indonesia</option>
                            <option value="London">London, UK</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label><i class="fas fa-comment"></i> Your Message *</label>
                        <textarea name="message" placeholder="Tell us about your travel plans..." rows="5" required></textarea>
                    </div>
                    <button type="submit" class="btn-submit">
                        <i class="fas fa-paper-plane"></i> Send Message
                    </button>
                </form>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3><i class="fas fa-plane-departure"></i> SafarSathi</h3>
                    <p>Making your travel dreams come true with exceptional service and unforgettable experiences since 2020.</p>
                    <div class="social-links">
                        <a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook"></i></a>
                        <a href="https://www.instagram.com/ved._.shrimali/" target="_blank"><i class="fab fa-instagram"></i></a>
                        <a href="https://x.com/?lang=en" target="_blank"><i class="fab fa-twitter"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                <div class="footer-section">
                    <h4>Quick Links</h4>
                    <ul>
                        <li><a href="#home">Home</a></li>
                        <li><a href="#destinations">Destinations</a></li>
                        <li><a href="#packages">Packages</a></li>
                        <li><a href="#contact">Contact Us</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h4>Popular Destinations</h4>
                    <ul>
                        <li><a href="#packages">Paris Packages</a></li>
                        <li><a href="#packages">Bali Packages</a></li>
                        <li><a href="#packages">London Packages</a></li>
                        <li><a href="#packages">View All</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h4>Newsletter</h4>
                    <p>Subscribe to get special offers and updates</p>
                    <div class="newsletter">
                        <input type="email" placeholder="Your email">
                        <button><i class="fas fa-arrow-right"></i></button>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025 SafarSathi. All rights reserved. | Designed with <i class="fas fa-heart"></i> for travelers</p>
            </div>
        </div>
    </footer>

        <!-- Booking Modal -->
        <div id="bookingModal" class="modal">
            <div class="modal-content">
                <span class="close-modal">&times;</span>
                <div class="modal-header">
                    <i class="fas fa-ticket-alt"></i>
                    <h3>Complete Your Booking</h3>
                    <p id="modal-package-info"></p>
                </div>
                <form id="bookingForm" action="<%= request.getContextPath() %>/BookPackageServlet" method="POST">
                    <input type="hidden" name="destination" id="modal-destination">
                    <input type="hidden" name="packageType" id="modal-packageType">
                    <input type="hidden" name="packagePrice" id="modal-packagePrice">

                    <div class="modal-form-group">
                        <label><i class="fas fa-user"></i> Full Name *</label>
                        <input type="text" name="name" placeholder="Enter your full name" required>
                    </div>

                    <div class="modal-form-group">
                        <label><i class="fas fa-envelope"></i> Email Address *</label>
                        <input type="email" name="email" placeholder="your@email.com" required>
                    </div>

                    <div class="modal-form-group">
                        <label><i class="fas fa-phone"></i> Contact Number *</label>
                        <input type="tel" name="contact" placeholder="+91 1234567890" required>
                    </div>

                    <div class="modal-form-group">
                        <label><i class="fas fa-users"></i> Number of Travelers *</label>
                        <input type="number" name="persons" min="1" max="10" value="1" required>
                    </div>

                    <div class="total-amount">
                        <span>Total Amount:</span>
                        <span id="totalAmount" class="amount">$0</span>
                    </div>

                    <button type="submit" class="btn-submit" id="payment-submit-btn">
                        <i class="fas fa-credit-card"></i> Proceed to Payment
                    </button>
                </form>
            </div>
        </div>

    <script src="<%= request.getContextPath() %>/js/script.js"></script>
</body>
</html>
