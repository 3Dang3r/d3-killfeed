let feed = document.getElementById("kill-feed");

window.addEventListener("message", function (event) {
    const { action, data, position, show } = event.data;

    if (action === "toggle") {
        feed.style.display = show ? "flex" : "none";
        return;
    }

    if (action === "setPosition" && position) {
        feed.className = position;
        return;
    }

    if (action === "addKill" && data) {
        let box = document.createElement("div");
        box.className = "kill-box";

        if (data.suicide) {
            box.innerHTML = `<span class="victim">${data.victim}</span><span>(Suicide)</span>`;
        } else {
            box.innerHTML = `<span class="killer">${data.killer}</span><span>killed</span><span class="victim">${data.victim}</span>`;
        }

        feed.appendChild(box);

        setTimeout(() => {
            box.remove();
        }, 5000);
    }
});
