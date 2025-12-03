
document.addEventListener("DOMContentLoaded", () => {
  console.log("Canteen Management System loaded successfully!");
});




// Handle Add to Cart without reload
document.addEventListener("DOMContentLoaded", function() {
    const forms = document.querySelectorAll(".menu-form");

    forms.forEach(form => {
        form.addEventListener("submit", function(e) {
            e.preventDefault(); 

            const formData = new FormData(form);

            fetch("add_to_cart.php", {
                method: "POST",
                body: formData
            })
            .then(response => response.json())
            .then(data => {
               
                document.querySelector(".cart-badge").textContent = data.cart_count;

                
                const icon = document.querySelector(".cart-link");
                icon.classList.add("cart-bounce");
                setTimeout(() => icon.classList.remove("cart-bounce"), 400);
            });
        });
    });
});
