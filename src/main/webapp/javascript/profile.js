function filterUsers() {
    var input, filter, userList, li,l, i, txtValue;
    input = document.getElementById('searchBar');
    filter = input.value.toUpperCase();
    userList = document.getElementById('userList');
    li = userList.getElementsByTagName('li');

    for (i = 0; i < li.length; i++) {
        l = li[i].getElementsByTagName('li')[0];
        txtValue = l.textContent ||l.innerText;
        if (txtValue.toUpperCase().includes(filter)) {
            li[i].style.display = '';
        } else {
            li[i].style.display = 'none';
        }
    }
}
