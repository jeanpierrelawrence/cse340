document.addEventListener('DOMContentLoaded', () => {
    const menuToggle = document.getElementById('menuToggle');
    const navMenu = document.getElementById('navMenu');

    if (menuToggle && navMenu) {
        menuToggle.addEventListener('click', () => {
            const isOpen = navMenu.classList.toggle('is-active');
            menuToggle.classList.toggle('is-active');
            document.body.classList.toggle('no-scroll', isOpen);
        });
    }
});