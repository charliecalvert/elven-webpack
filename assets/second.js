const PROMPT = 'I am the secopnd module.';
console.log(PROMPT);

function component() {
    const element = document.createElement('div');
    element.textContent = PROMPT;
    return element;
}

document.body.appendChild(component());
