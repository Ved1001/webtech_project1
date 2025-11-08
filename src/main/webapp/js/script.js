// Mobile Navigation Toggle
const hamburger = document.querySelector('.hamburger');
const navLinks = document.querySelector('.nav-links');

if (hamburger) {
    hamburger.addEventListener('click', () => {
        hamburger.classList.toggle('active');
        navLinks.classList.toggle('active');
    });

    document.querySelectorAll('.nav-links a').forEach(link => {
        link.addEventListener('click', () => {
            hamburger.classList.remove('active');
            navLinks.classList.remove('active');
        });
    });
}

// Smooth Scrolling
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Header Scroll Effect
window.addEventListener('scroll', () => {
    const header = document.querySelector('.header');
    if (window.scrollY > 100) {
        header.style.background = 'rgba(255, 255, 255, 0.98)';
        header.style.boxShadow = '0 5px 30px rgba(0,0,0,0.15)';
    } else {
        header.style.background = 'rgba(255, 255, 255, 0.95)';
        header.style.boxShadow = '0 2px 20px rgba(0,0,0,0.1)';
    }
});

// Booking Modal
const modal = document.getElementById('bookingModal');
const closeModal = document.querySelector('.close-modal');
const bookButtons = document.querySelectorAll('.btn-book');

// Open modal
bookButtons.forEach(button => {
    button.addEventListener('click', function(e) {
        e.preventDefault();

        const destination = this.getAttribute('data-destination');
        const packageType = this.getAttribute('data-package');
        const packagePrice = this.getAttribute('data-price');

        console.log('Booking:', destination, packageType, packagePrice);

        document.getElementById('modal-destination').value = destination;
        document.getElementById('modal-packageType').value = packageType;
        document.getElementById('modal-packagePrice').value = packagePrice;

        const packageInfo = document.getElementById('modal-package-info');
        if (packageInfo) {
            packageInfo.textContent = `${destination} - ${packageType} Package ($${packagePrice})`;
        }

        updateTotalAmount(packagePrice, 1);

        const form = document.getElementById('bookingForm');
        if (form) {
            form.reset();
            document.querySelector('input[name="persons"]').value = 1;
        }

        modal.style.display = 'block';
        document.body.style.overflow = 'hidden';
    });
});

// Close modal
if (closeModal) {
    closeModal.addEventListener('click', () => {
        closeModalFunction();
    });
}

window.addEventListener('click', (e) => {
    if (e.target === modal) {
        closeModalFunction();
    }
});

function closeModalFunction() {
    modal.style.display = 'none';
    document.body.style.overflow = 'auto';

    const form = document.getElementById('bookingForm');
    if (form) form.reset();

    const submitBtn = document.getElementById('payment-submit-btn');
    if (submitBtn) {
        submitBtn.disabled = false;
        submitBtn.innerHTML = '<i class="fas fa-credit-card"></i> Proceed to Payment';
        submitBtn.classList.remove('loading');
    }
}

// Update total amount
const personsInput = document.querySelector('input[name="persons"]');
if (personsInput) {
    personsInput.addEventListener('input', function() {
        const pricePerPerson = document.getElementById('modal-packagePrice').value;
        const persons = this.value;
        updateTotalAmount(pricePerPerson, persons);
    });
}

function updateTotalAmount(pricePerPerson, persons) {
    const total = parseInt(pricePerPerson) * parseInt(persons);
    const totalElement = document.getElementById('totalAmount');
    if (totalElement) {
        totalElement.textContent = `$${total}`;
    }
}

// Form submission with AJAX (XMLHttpRequest)
const bookingForm = document.getElementById('bookingForm');
if (bookingForm) {
    bookingForm.addEventListener('submit', function(e) {
        e.preventDefault();

        const name = this.querySelector('input[name="name"]').value.trim();
        const email = this.querySelector('input[name="email"]').value.trim();
        const contact = this.querySelector('input[name="contact"]').value.trim();
        const persons = this.querySelector('input[name="persons"]').value;

        if (!name || !email || !contact) {
            alert('❌ Please fill all required fields');
            return false;
        }

        if (persons < 1 || persons > 10) {
            alert('❌ Number of travelers must be between 1 and 10');
            return false;
        }

        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            alert('❌ Please enter a valid email address');
            return false;
        }

        const submitBtn = document.getElementById('payment-submit-btn');
        if (submitBtn) {
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Processing...';
            submitBtn.classList.add('loading');
        }

        // Create XMLHttpRequest object
        const xhr = new XMLHttpRequest();
        xhr.open('POST', '/your-booking-endpoint', true); // replace with your actual endpoint

        xhr.onload = function() {
            if (xhr.status >= 200 && xhr.status < 300) {
                alert('✅ Booking successful! Thank you.');
                bookingForm.reset();
                if (submitBtn) {
                    submitBtn.disabled = false;
                    submitBtn.innerHTML = '<i class="fas fa-credit-card"></i> Proceed to Payment';
                    submitBtn.classList.remove('loading');
                }
                modal.style.display = 'none';
                document.body.style.overflow = 'auto';
            } else {
                alert('❌ Booking failed: ' + xhr.statusText);
                if (submitBtn) {
                    submitBtn.disabled = false;
                    submitBtn.innerHTML = '<i class="fas fa-credit-card"></i> Proceed to Payment';
                    submitBtn.classList.remove('loading');
                }
            }
        };

        xhr.onerror = function() {
            alert('❌ Request failed.');
            if (submitBtn) {
                submitBtn.disabled = false;
                submitBtn.innerHTML = '<i class="fas fa-credit-card"></i> Proceed to Payment';
                submitBtn.classList.remove('loading');
            }
        };

        const formData = new FormData(bookingForm);
        xhr.send(formData);

        return false;
    });
}

// Contact form validation
const contactForm = document.querySelector('.contact-form');
if (contactForm) {
    contactForm.addEventListener('submit', function(e) {
        const name = this.querySelector('input[name="name"]').value.trim();
        const email = this.querySelector('input[name="email"]').value.trim();
        const message = this.querySelector('textarea[name="message"]').value.trim();

        if (!name || !email || !message) {
            e.preventDefault();
            alert('❌ Please fill all required fields');
            return false;
        }

        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            e.preventDefault();
            alert('❌ Please enter a valid email address');
            return false;
        }

        const submitBtn = this.querySelector('.btn-submit');
        if (submitBtn) {
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Sending...';
        }

        return true;
    });
}

// Payment status check
window.addEventListener('load', function() {
    const urlParams = new URLSearchParams(window.location.search);
    const paymentStatus = urlParams.get('payment');

    if (paymentStatus === 'success') {
        alert('✅ Payment Successful! Thank you for booking with SafarSathi.');
        window.history.replaceState({}, document.title, window.location.pathname);
    } else if (paymentStatus === 'failed') {
        alert('❌ Payment Failed. Please try again.');
        window.history.replaceState({}, document.title, window.location.pathname);
    } else if (paymentStatus === 'cancelled') {
        alert('⚠️ Payment Cancelled.');
        window.history.replaceState({}, document.title, window.location.pathname);
    }
});

// Scroll animations
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -100px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

document.querySelectorAll('.feature-card, .destination-card, .package-card').forEach(card => {
    card.style.opacity = '0';
    card.style.transform = 'translateY(30px)';
    card.style.transition = 'all 0.6s ease';
    observer.observe(card);
});

// Newsletter
const newsletterForm = document.querySelector('.newsletter');
if (newsletterForm) {
    const newsletterBtn = newsletterForm.querySelector('button');
    newsletterBtn.addEventListener('click', function(e) {
        e.preventDefault();
        const input = newsletterForm.querySelector('input');
        const email = input.value.trim();

        if (email) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (emailRegex.test(email)) {
                alert('✅ Thank you for subscribing!');
                input.value = '';
            } else {
                alert('❌ Please enter a valid email');
            }
        } else {
            alert('❌ Please enter your email');
        }
    });
}

console.log('✈️ SafarSathi Loaded!');
