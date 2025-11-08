<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Payment - SafarSathi</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .payment-box {
            background: white;
            padding: 50px;
            border-radius: 25px;
            text-align: center;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            max-width: 550px;
            width: 90%;
        }
        .payment-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #4ecdc4, #00b894);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 30px;
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }
        .payment-icon i {
            font-size: 2.5rem;
            color: white;
        }
        h2 {
            color: #2d3436;
            margin-bottom: 20px;
        }
        .payment-details {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 12px;
            margin: 20px 0;
            text-align: left;
        }
        .detail-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #e9ecef;
        }
        .detail-row:last-child {
            border-bottom: none;
            font-weight: 600;
            font-size: 1.2rem;
            color: #4ecdc4;
        }
        .detail-label {
            color: #636e72;
        }
        .detail-value {
            font-weight: 600;
            color: #2d3436;
        }
        .spinner {
            border: 4px solid #f3f3f3;
            border-top: 4px solid #4ecdc4;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 1s linear infinite;
            margin: 20px auto;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        p {
            color: #636e72;
            font-size: 1rem;
        }
        .conversion-note {
            font-size: 0.85rem;
            color: #95a5a6;
            margin-top: 10px;
        }
        #countdown {
            font-size: 1.1rem;
            font-weight: 600;
            color: #4ecdc4;
            margin-top: 15px;
        }
        .promo-code-group {
            margin-top: 20px;
            text-align: left;
        }
        .promo-code-group label {
            font-weight: 600;
            color: #2d3436;
        }
        .promo-input {
            width: 70%;
            padding: 8px;
            margin-right: 5px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 1rem;
        }
        .promo-btn {
            background: #4ecdc4;
            border: none;
            color: white;
            padding: 9px 15px;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        .promo-btn:hover {
            background: #00b894;
        }
        .promo-message {
            margin-top: 10px;
            font-size: 0.9rem;
            color: #27ae60;
            font-weight: 600;
        }
        .promo-error {
            color: #e74c3c;
        }
    </style>
</head>
<body>
    <div class="payment-box">
        <div class="payment-icon">
            <i class="fas fa-lock"></i>
        </div>
        <h2>🔒 Secure Payment</h2>

        <div class="payment-details" id="paymentDetails">
            <div class="detail-row">
                <span class="detail-label">Package:</span>
                <span class="detail-value"><%= request.getAttribute("destination") %> - <%= request.getAttribute("packageType") %></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Travelers:</span>
                <span class="detail-value"><%= request.getAttribute("persons") %> Person(s)</span>
            </div>
            <div class="detail-row" id="amountUsdRow">
                <span class="detail-label">Amount (USD):</span>
                <span class="detail-value" id="amountUsd">$<%= request.getAttribute("totalAmountUSD") %></span>
            </div>
            <div class="detail-row" id="amountInrRow">
                <span class="detail-label">Amount (INR):</span>
                <span class="detail-value" id="amountInr">₹<%= request.getAttribute("totalAmountINR") %></span>
            </div>
        </div>

        <div>
            Time to complete payment: <span id="countdown">10:00</span>
        </div>

        <div class="promo-code-group">
            <label for="promoCode">Promo Code:</label><br/>
            <input type="text" id="promoCode" name="promoCode" class="promo-input" placeholder="Enter promo code" />
            <button type="button" id="applyPromoBtn" class="promo-btn">Apply</button>
            <div id="promoMessage" class="promo-message"></div>
        </div>

        <div class="spinner"></div>
        <p>Opening payment gateway...</p>
        <p class="conversion-note">1 USD = 90 INR (Conversion applied)</p>
    </div>

    <script>
        // Countdown Timer - 10 minutes
        let timeLeft = 600;
        const countdownEl = document.getElementById('countdown');

        function updateCountdown() {
            let minutes = Math.floor(timeLeft / 60);
            let seconds = timeLeft % 60;
            countdownEl.textContent = minutes + ":" + (seconds < 10 ? "0" : "") + seconds;
            if (timeLeft <= 0) {
                clearInterval(timerId);
                alert("Payment time expired. Please try booking again.");
                window.location.href = "<%= request.getContextPath() %>/index.jsp?payment=timeout";
            }
            timeLeft--;
        }
        let timerId = setInterval(updateCountdown, 1000);

        // Original amounts from server
        const originalUsd = parseFloat("<%= request.getAttribute("totalAmountUSD") %>");
        const originalInr = parseInt("<%= request.getAttribute("totalAmountINR") %>");
        const conversionRate = 90;

        // Promo codes hardcoded for demo
        const promoCodes = {
            "VED10": 10,  // 10% discount
            "TRAVEL20": 20 // 20% discount
        };

        let appliedDiscount = 0;

        document.getElementById('applyPromoBtn').addEventListener('click', function() {
            const code = document.getElementById('promoCode').value.trim().toUpperCase();
            const promoMsg = document.getElementById('promoMessage');

            if (code in promoCodes) {
                appliedDiscount = promoCodes[code];
                const discountedUsd = originalUsd * (1 - appliedDiscount / 100);
                const discountedInr = Math.round(discountedUsd * conversionRate);

                document.getElementById('amountUsd').textContent = "$" + discountedUsd.toFixed(2);
                document.getElementById('amountInr').textContent = "₹" + discountedInr;

                promoMsg.textContent = "Promo code applied! You got " + appliedDiscount + "% off.";
                promoMsg.classList.remove("promo-error");
            } else {
                promoMsg.textContent = "Invalid promo code.";
                promoMsg.classList.add("promo-error");
                appliedDiscount = 0;

                // Reset amounts if invalid code
                document.getElementById('amountUsd').textContent = "$" + originalUsd.toFixed(2);
                document.getElementById('amountInr').textContent = "₹" + originalInr;
            }
        });

        // Razorpay options configured with discounted amount dynamically
        function openRazorpay(discountPerc) {
            let discountPercent = discountPerc || 0;
            let finalUsd = originalUsd * (1 - discountPercent / 100);
            let finalInr = Math.round(finalUsd * conversionRate);
            let finalAmountPaise = finalInr * 100;

            const options = {
                "key": "<%= request.getAttribute("keyId") %>",
                "amount": finalAmountPaise.toString(),
                "currency": "INR",
                "name": "SafarSathi",
                "description": "<%= request.getAttribute("destination") %> - <%= request.getAttribute("packageType") %> Package",
                "order_id": "<%= request.getAttribute("orderId") %>",
                "prefill": {
                    "name": "<%= request.getAttribute("name") %>",
                    "email": "<%= request.getAttribute("email") %>",
                    "contact": "<%= request.getAttribute("contact") %>"
                },
                "theme": { "color": "#4ecdc4" },
                "handler": function (response){
                    alert("✅ Payment Successful!\n\nPayment ID: " + response.razorpay_payment_id + "\nAmount: ₹" + finalInr);
                    window.location.href = "<%= request.getContextPath() %>/index.jsp?payment=success";
                },
                "modal": {
                    "ondismiss": function(){
                        alert("Payment cancelled");
                        window.location.href = "<%= request.getContextPath() %>/index.jsp?payment=cancelled";
                    }
                }
            };

            const rzp = new Razorpay(options);
            rzp.on('payment.failed', function(response){
                alert("❌ Payment Failed!\n\n" + response.error.description);
                window.location.href = "<%= request.getContextPath() %>/index.jsp?payment=failed";
            });

            rzp.open();
        }

        // Open Razorpay modal automatically after a delay
        // But ensure discount is applied before auto-opening (delay here 10 secs for promo code)
        setTimeout(() => {
            openRazorpay(appliedDiscount);
        }, 10000); // 10 seconds delay

    </script>
</body>
</html>
