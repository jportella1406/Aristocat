/**
 *
 * @author Starlord
 */
var modalAgregar = document.getElementById('modalAgregar');
modalAgregar.addEventListener('show.bs.modal', function (event) {
    var button = event.relatedTarget; 
    var productoId = button.getAttribute('data-producto-id');
    var productoNombre = button.getAttribute('data-producto-nombre');
    var productoPrecio = button.getAttribute('data-producto-precio');

    var modalProductoId = modalAgregar.querySelector('#productoId');
    var modalProductoNombre = modalAgregar.querySelector('#productoNombre');
    var modalProductoPrecio = modalAgregar.querySelector('#productoPrecio');
    var modalPrecioTotal = modalAgregar.querySelector('#precioTotal');

    modalProductoId.value = productoId;
    modalProductoNombre.value = productoNombre;
    modalProductoPrecio.value = 'S/' + productoPrecio;

    var cantidadInput = modalAgregar.querySelector('#cantidad');

    cantidadInput.addEventListener('input', function () {
        var cantidad = parseInt(cantidadInput.value);
        var precioUnitario = parseFloat(productoPrecio);
        var total = cantidad * precioUnitario;
        modalPrecioTotal.value = 'S/' + total.toFixed(2);
    });

    cantidadInput.dispatchEvent(new Event('input'));
});



