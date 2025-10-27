 <%-- 
    Document   : index
    Created on : 31 feb 6666, 66:66:66
    Author     : Starlord
--%>
<%@ page import="java.sql.*" %>
<%@ page import="Config.Conexion" %>
<%@ page import="Modelo.Usuario" %>

<div id="loginModal" class="modal">
    <span class="close">&times;</span>
    <div class="center">
        <div class="ear ear--left"></div>
        <div class="ear ear--right"></div>
        <div class="face">
            <div class="eyes">
                <div class="eye eye--left">
                    <div class="glow"></div>
                </div>
                <div class="eye eye--right">
                    <div class="glow"></div>
                </div>
            </div>
            <div class="nose">
                <svg width="38.161" height="22.03">
                <path d="M2.017 10.987Q-.563 7.513.157 4.754C.877 1.994 2.976.135 6.164.093 16.4-.04 22.293-.022 32.048.093c3.501.042 5.48 2.081 6.02 4.661q.54 2.579-2.051 6.233-8.612 10.979-16.664 11.043-8.053.063-17.336-11.043z" fill="#243946"></path>
                </svg>
                <div class="glow"></div>
            </div>
            <div class="mouth">
                <svg class="smile" viewBox="-2 -2 84 23" width="84" height="23">
                <path d="M0 0c3.76 9.279 9.69 18.98 26.712 19.238 17.022.258 10.72.258 28 0S75.959 9.182 79.987.161" fill="none" stroke-width="3" stroke-linecap="square" stroke-miterlimit="3"></path>
                </svg>
                <div class="mouth-hole"></div>
                <div class="tongue breath">
                    <div class="tongue-top"></div>
                    <div class="line"></div>
                    <div class="median"></div>
                </div>
            </div>
        </div>
        <div class="hands">
            <div class="hand hand--left">
                <div class="finger">
                    <div class="bone"></div>
                    <div class="nail"></div>
                </div>
                <div class="finger">
                    <div class="bone"></div>
                    <div class="nail"></div>
                </div>
                <div class="finger">
                    <div class="bone"></div>
                    <div class="nail"></div>
                </div>
            </div>
            <div class="hand hand--right">
                <div class="finger">
                    <div class="bone"></div>
                    <div class="nail"></div>
                </div>
                <div class="finger">
                    <div class="bone"></div>
                    <div class="nail"></div>
                </div>
                <div class="finger">
                    <div class="bone"></div>
                    <div class="nail"></div>
                </div>
            </div>
        </div>
        <div class="login">
            <form id="loginForm"  action="/login" method="POST">
                <label>
                    <div class="fa fa-user"></div>
                    <input name="username" class="username" type="text" autocomplete="on" placeholder="Usuario" required />
                </label>
                <label>
                    <div class="fa fa-lock"></div>
                    <input id="password" name="password" class="password" type="password" autocomplete="off" placeholder="Contraseña" required />

                    <span class="password-button" id="togglePassword">
                        <i class="fa fa-eye"></i>
                    </span>
                </label>
                <button class="login-button" type="submit">Iniciar Sesión</button>
            </form>
        </div>
        <div class="social-buttons">
            <div class="social" >
                <div class="fa fa-paw" style="color: white;"> <!--<img class="" src="/files/logos/LogoSinFondo.png" style="width: 30px; height: 30px;" alt="Imagen de Usuario">--></div>
            </div>
            <div class="social">
                <div class="fa fa-paw" style="color: white;"> <!--<img class="" src="/files/logos/LogoSinFondo.png" style="width: 30px; height: 30px;" alt="Imagen de Usuario">--></div>
            </div>
            <div class="social">
                <div class="fa fa-paw" style="color: white;"> <!--<img class="" src="/files/logos/LogoSinFondo.png" style="width: 30px; height: 30px;" alt="Imagen de Usuario">--></div>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault(); 
    const usuario = document.querySelector('input[name="username"]').value;
    const contrasena = document.querySelector('input[name="password"]').value;
    fetch('/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json' 
        },
        body: JSON.stringify({ usuario, contrasena }) 
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            window.location.href = '/CarritoServlet?action=listar'; 
        } else {
            swal('Error!', data.message, 'error'); 
        }
    })
    .catch(error => {
        console.error('Error:', error);
        swal('Error!', 'Ocurrió un error inesperado.', 'error'); 
    });
});
</script>

