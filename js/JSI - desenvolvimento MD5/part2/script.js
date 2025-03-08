document.addEventListener('DOMContentLoaded', () => {
    // Método Simples: Adicionando um título ao site
    document.body.innerHTML += "<h1 id='titulo'>Minha Loja Online</h1>";

    // Método Complexo: Criando os elementos manualmente
    const produto = document.createElement("div"); // Criando a div do produto
    produto.id = "produto"; // Adicionando um ID

    const nome = document.createElement("h2");
    nome.textContent = "Smartphone XYZ";

    const descricao = document.createElement("p");
    descricao.textContent = "Um smartphone moderno com câmera de 108MP e tela AMOLED.";

    const preco = document.createElement("p");
    preco.textContent = "Preço: R$ 2.499,00";

    const imagem = document.createElement("img");
    imagem.src = "smartphone.avif"; // Imagem genérica
    imagem.alt = "Imagem do Smartphone XYZ";

    // Adicionando os elementos dentro da div do produto
    produto.appendChild(nome);
    produto.appendChild(imagem);
    produto.appendChild(descricao);
    produto.appendChild(preco);

    // Adicionando o produto ao body
    document.body.appendChild(produto);
})
