 <%-- 
    Document   : index
    Created on : 31 feb 6666, 66:66:66
    Author     : Starlord
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <jsp:include page="/login/Login.jsp" />
    <jsp:include page="/includes/Head.jsp" />
    <jsp:include page="/includes/Navbar.jsp" />
    <main>
        <!-- About Us -->
        <section class="about-us">
            <div class="info">
                <h3>Acerca de nosotros</h3>
                <p>En "Amor Peludo", nos apasiona cuidar de tus mascotas como si fueran de nuestra propia familia. Nuestro equipo de veterinarios y personal especializado se dedica a ofrecer atención veterinaria de calidad, asegurando la salud y el bienestar de cada animal que atendemos. 
                    Ofrecemos una amplia gama de servicios, desde chequeos de rutina y vacunaciones hasta atención de emergencia. Nos enorgullece crear un ambiente acogedor y confiable, donde tanto tú como tu mascota se sientan cómodos. 
                    Tu amigo peludo merece lo mejor, y estamos aquí para proporcionárselo.</p>
                <hr>
            </div>

            <div class="free-content">
                <h4>Contenido Extra!</h4>
                <div class="icons">
                    <div>
                        <div class="span-icon"><span><i class="fas fa-store"></i></span></div>
                        <h6>Pet Shop</h6>
                        <p>Ofrecemos una variedad de productos para el cuidado de tus mascotas, desde alimentos de calidad hasta juguetes y accesorios.</p>
                    </div>

                    <div>
                        <div class="span-icon"><span><i class="fas fa-bone"></i></span></div>
                        <h6>Alimentación</h6>
                        <p>Ofrecemos una selección de alimentos de alta calidad, adaptados a las necesidades nutricionales de perros y gatos de todas las edades.</p>
                    </div>

                    <div>
                        <div class="span-icon"><span><i class="fas fa-tablets"></i></span></div>
                        <h6>Medicamentos y Antipulgas</h6>
                        <p>Ofrecemos una gama de medicamentos y productos antipulgas de alta calidad para mantener a tus mascotas saludables y libres de parásitos.</p>
                    </div>

                </div>
            </div>
        </section>

        <!-- Gallery -->
        <section class="gallery-section">
            <div class="animal-icon">
                <i class="fas fa-paw"></i>
            </div>

            <div class="gallery-content">
                <div class="img-card"><img src="/imagenes/imagen1.jpg" alt="animal"></div>
                <div class="img-card"><img src="/imagenes/imagen2.jpg" alt="animal"></div>
                <div class="img-card"><img src="/imagenes/imagen3.jpg" alt="animal"></div>
                <div class="img-card"><img src="/imagenes/imagen4.jpg" alt="animal"></div>
                <div class="img-card"><img src="/imagenes/imagen5.jpg" alt="animal"></div>
                <div class="img-card"><img src="/imagenes/imagen6.jpg" alt="animal"></div>
                <div class="img-card"><img src="/imagenes/imagen7.jpg" alt="animal"></div>
                <div class="img-card"><img src="/imagenes/imagen8.jpg" alt="animal"></div>
                <div class="img-card"><img src="/imagenes/imagen9.jpg" alt="animal"></div>
                <div class="img-card"><img src="/imagenes/imagen10.jpg" alt="animal"></div>
                <div class="img-card"><img src="/imagenes/imagen11.jpg" alt="animal"></div>
                <div class="img-card"><img src="/imagenes/imagen12.jpg" alt="animal"></div>
            </div>

            <!-- Modal -->
            <div class="modal">
                <span id="closeModal"><i class="fas fa-times"></i></span>
                <img id="imgModal">
                <p id="caption"></p>
            </div>

        </section>

    </main>
    <jsp:include page="/includes/Footer.jsp" />

</html>
