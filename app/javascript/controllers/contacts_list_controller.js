import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="contacts-list"
export default class extends Controller {
  static targets = ["contact"];

  connect() {
    // Pega a localização do navegador
    const currentHref = window.location.href;
    // Para cada um dos links, verifica se o href do link bate com a localização
    // atual da janela. Se bater, adiciona a classe .active
    this.contactTargets.forEach((contact) => {
      if (contact.href === currentHref) {
        contact.classList.add("active");
      }
    });
  }

  highlight(event) {
    // Remove a classe .active de todos os contatos
    this.contactTargets.forEach((contact) => {
      contact.classList.remove("active");
    });
    // Adiciona a classe .active no contato que foi clicado
    event.currentTarget.classList.add('active')
  }
}
