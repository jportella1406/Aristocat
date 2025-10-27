/**
 *
 * @author Starlord
 */
let usernameInput = document.querySelector('.username');
let passwordInput = document.querySelector('.password');
let showPasswordButton = document.querySelector('.password-button');
let face = document.querySelector('.face');

passwordInput.addEventListener('focus', event => {
    document.querySelectorAll('.hand').forEach(hand => {
        hand.classList.add('hide');
    });
    document.querySelector('.tongue').classList.remove('breath');
});

passwordInput.addEventListener('blur', event => {
    document.querySelectorAll('.hand').forEach(hand => {
        hand.classList.remove('hide');
        hand.classList.remove('peek');
    });
    document.querySelector('.tongue').classList.add('breath');
});

usernameInput.addEventListener('focus', event => {
    let length = Math.min(usernameInput.value.length - 16, 19);
    document.querySelectorAll('.hand').forEach(hand => {
        hand.classList.remove('hide');
        hand.classList.remove('peek');
    });

    face.style.setProperty('--rotate-head', `${-length}deg`);
});

usernameInput.addEventListener('blur', event => {
    face.style.setProperty('--rotate-head', '0deg');
});

usernameInput.addEventListener('input', _.throttle(event => {
    let length = Math.min(event.target.value.length - 16, 19);

    face.style.setProperty('--rotate-head', `${-length}deg`);
}, 100));

const togglePassword = document.getElementById('togglePassword');

togglePassword.addEventListener('click', function () {
    const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordInput.setAttribute('type', type);
    this.querySelector('i').classList.toggle('fa-eye'); 
    this.querySelector('i').classList.toggle('fa-eye-slash'); 
});