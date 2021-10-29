<!--/* <form method="post" action="index.php?page=2">
    <section>
        <label for="login">Логин: </label>
        <input id="login" type="text" name="login">
    </section>
    <section>
        <label for="password">Пароль: </label>
        <input id="password" type="password" name="password">
    </section>
    <footer>
        <button type="submit" name="btn-login">
            Войти
        </button>
        <a class="likeBtn" href="index.php?page=1">
            Назад
        </a>
    </footer>
</form> */-->

<?php
    $LoginField = new inputString("login", "Логин:", "text");
    $sectionL1 = new FormSection($LoginField->getInputString());

    $LoginField = new inputString("password", "Пароль:", "password");
    $sectionL2 = new FormSection($LoginField->getInputString());

    $Login = new Button("submit", "Войти", "btn-login");
    $Back = new Button("a", "Назад", "", "", "index.php?page=1");
    $footerL = new FormFooter($Login, $Back);

    $FormL = new Form("index.php?page=2", "POST", $sectionL1, $sectionL2, $footerL);
    $FormL->showForm();

    if (isset($_POST["btn-login"])) {
        if (($_POST['login'] == '') || ($_POST['password'] == ''))
        {
            echo '<p class = "in">Заполните оба поля!</p>';
        }
        else
        {
            $password_hash = md5($_POST['password']);

            $connection = mysqli_connect("localhost", "root", "", "guestbook");

            $query = "SELECT * FROM `users` WHERE `Login` LIKE '".$_POST['login']."' AND `Password_hash` LIKE '".$password_hash."'";
            $result = mysqli_query($connection, $query);

            if ($row = mysqli_fetch_assoc($result) )
            {
                echo '<p class = "in">Добро пожаловать, '.$row["SurName"].' '.$row["Name"].'!</p><br>';
                $_SESSION['login'] = $_POST['login'];
                $_SESSION['user'] = $row["Name"].' '.$row["SurName"];
                $_SESSION['login_id'] = $row["id"];
            }
            else {
                echo '<p class = "in">Неверно указан логин или пароль пользователя!</p>';
                $_SESSION = [];
            }
        }
    }
?>