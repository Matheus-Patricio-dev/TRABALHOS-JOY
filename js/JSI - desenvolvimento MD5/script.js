document.addEventListener("DOMContentLoaded", () => {
    const titulo = document.getElementById('titulo')
    titulo.innerText = "Titulo"

    const A = document.querySelector("a")
    A.innerText = "Link para Proz"

    const ul = document.querySelector("ul")
    ul.innerHTML = 
    `
    <li>Item 1</li>
    <li>Item 2</li>
    <li>Item 3</li>

    `

    const ol = document.getElementById("lista-ordenada") 
    ol.innerHTML = 
    `
    <a href="https://www.google.com.br/?hl=pt-BR">Google<a/>
    <a href="https://www.youtube.com/">Youtube</a>
    <a href="https://www.instagram.com/">Instagram</a>
    `
})