/**
 * Interval which the clock will be updated (in milliseconds).
 */
const clockInterval = 100;

const tabKeyCode = 9;
const enterKeyCode = 13;
const escapeKeyCode = 27;
const searchBarElement = document.querySelector('.search-bar');
const clockElement = document.querySelector('#clock');

/**
 * Return a string containing the formatted current date and time.
 */
function getDateTime() {
    const dateTime = new Date();
    let day = dateTime.getDate();
    let month = dateTime.getMonth() + 1;
    let hour = dateTime.getHours();
    let minutes = dateTime.getMinutes();
    let seconds = dateTime.getSeconds();

    if (hour < 0) {
        hour = 24 + hour;
    }

    let date = (day < 10 ? '0' + day : day) + '/' + (month < 10 ? '0' + month : month) + '/' + dateTime.getFullYear();
    let time = (hour < 10 ? '0' + hour : hour) + ':' + (minutes < 10 ? '0' + minutes : minutes) + ':' + (seconds < 10 ? '0' + seconds : seconds);

    return date + '\n' + time;
}

function setClock() {
    clockElement.innerText = getDateTime();
}



setClock();

setInterval(() => {
    setClock();
}, clockInterval);

searchBarElement.focus();
searchBarElement.value = '';


function refreshList() {
    let items = JSON.parse(localStorage.getItem('items'));
    $('ul').empty();
    items.forEach(item => {
        $('ul').append("<li>" + item + "</li>");
    });
}

$(document).ready(function () {
    $("input[type='text']").val('');
    refreshList();

});

//remove from list
$("#todoList").on("click", "li", function () {
    $(this).toggleClass("done");
    let index = $(this).index();
    let items = JSON.parse(localStorage.getItem('items'));
    items.splice(index, 1);
    localStorage.setItem('items', JSON.stringify(items));
    $(this).fadeOut(500, function () {
        $(this).remove();
    });
    event.stopPropagation(); //stop event bubbling
});

//add to list
$("#todoInput").keypress(function (event) {
    if (event.which === 13 && $(this).val().length !== 0) {
        let value = $(this).val();
        let items = JSON.parse(localStorage.getItem('items'));
        items.push(value);
        localStorage.setItem('items', JSON.stringify(items));
        refreshList();
        $(this).val('');
    }
});