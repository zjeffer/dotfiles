(function numberOfPlays() {
    if (!Spicetify.LocalStorage) {
        setTimeout(numberOfPlays, 1000);
        return;
    }

    console.log("loaded");

    function albumPopularity(data) {
        //select all table rows
        let albumCells = data.querySelectorAll(".Table__table tbody tr.TableRow.TableRow td:last-child");
        console.log(albumCells);
        //check if the current window is the album view or the artist view
        if (albumCells != undefined && albumCells.length != 0) {
            //for album view
            for (let cell of albumCells) {
                //get amount from attribute
                let plays = cell.firstChild.getAttribute("data-tooltip-text");
                if (plays != null) {
                    //change cell value
                    cell.innerHTML = `<div>${plays.substring(0, plays.indexOf("plays") - 1)}</div>`;
                }
            }
        }
    }

    function artistPopularity(data) {
        //search doc for all artistCells
        let artistCells = data.children[0].querySelectorAll(".tl-body tr .tl-popularity");
        console.log(artistCells);
        for (let cell of artistCells) {
            //get amount from attribute
            let plays = cell.getAttribute("data-tooltip");
            //change cell value
            cell.innerHTML = `<div>${plays.substring(0, plays.indexOf("plays") - 1)}</div>`;
        }
    }

    function onChange(data) {
        if (data.id == "artist") {
            console.log("artistdata:");
            console.log(data);
            artistPopularity(data.container.contentDocument);

            const observer = new MutationObserver(() => {
                artistPopularity(data.container.contentDocument);
            });

            observer.observe(data.container.children[0].querySelector(".albums ul"), {
                childList: true,
                subtree: true,
            });
        } else if (data.id == "album") {
            console.log("albumdata:");
            console.log(data);
            albumPopularity(data.container.children[0]);

            const observer = new MutationObserver(() => {
                albumPopularity(data.container.children[0]);
            });

            observer.observe(data.container.children[0].querySelector(".Table__table"), {
                childList: true,
                subtree: true,
            });
        }
    }

    Spicetify.Player.addEventListener("appchange", ({ data: data }) => {
        console.log("appchange");
        onChange(data);
    });


    // this function needs fixing
    const iframeInterval = setInterval(() => {
        /** @type {HTMLIFrameElement} */

        console.log("interval");

        const currentIframe = document.querySelector("iframe.active");

        if (!currentIframe) {
            return;
        }

        if (currentIframe.id === "app-collection-songs") {
            console.log("clearing interval");
            clearInterval(iframeInterval);
            return;
        }
        if (currentIframe.id !== "app-artist") {
            return;
        }

        let cells = currentIframe.contentDocument.querySelectorAll(".tl-body tr .tl-popularity");
        for (let c of cells) {
            //get amount from attribute
            let plays = c.getAttribute("data-tooltip");
            //change cell value
            c.innerHTML = `<div>${plays.substring(0, plays.indexOf("plays") - 1)}</div>`;
        }

        console.log("iframe cells:");
        console.log(cells);

        if (cells.length > 0) {
            // const observer = new MutationObserver(() => {
            //     artistPopularity(cells[0].ownerDocument);
            // });

            // let node = cells[0].ownerDocument.querySelector(".albums");
            // console.log(node);

            // observer.observe(node, {
            //     childList: true,
            //     subtree: true,
            // });
            console.log("clearing interval");
            clearInterval(iframeInterval);
        }
    }, 500);
})();
