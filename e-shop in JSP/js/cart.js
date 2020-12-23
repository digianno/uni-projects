document.ready(function() {

    $('.addtocart').click(function(event) {
        event.preventDefault();

        var quantity = $("#" + $(this).attr("data-quantity-field")).val();
        var productcode = $(this).attr("data-quantity-field");
        var productprice = $(this).attr("data-product-price");
        var productname = $(this).attr("data-product-name");
        var productimage = $(this).attr("data-product-image");
        var productcategory = $(this).attr("data-product-category");

        addToCart(productcode, productname, productprice, quantity, productimage,productcategory);

    });

});


function addToCart(productcode, productname, productprice, quantity, pimage,productcategory) {

    $.ajaxSetup({
        headers: {
            'X-Request-page': 'my_ajax_script'
        }
    });

    $.ajax({
            url: "addtocart-ajax.jsp",
            type: "POST",
            data: {
                code: productcode,
                name: productname,
                price: productprice,
                quantity: quantity,
                image: pimage,
                category : productcategory
            },
            async: true
        })
        .done(function(html_out) {
            $("#cart_total_products").html(html_out);

            showmessage('Το προϊόν <strong>' + productcode + '</strong> προστέθηκε στο καλάθι αγορών');

        })
        .fail(function(errormsg) {
            showmessage('<strong>Σφάλμα</strong>: ' + errormsg.responseText);
        })
}

function showmessage(message) {
    $("#screenmsg").html(message);
    $('#msgmodal').modal('show');
}