<!-- /* <?php
    if(!isset($_SESSION['login']))
    {
        $hidden = true;
    }
?>

<form action="index.php?page=1" method="post">
    <header>
        <h1>Добро пожаловать!</h1>
    </header>
    <section>
       <textarea rows="3" name="message"></textarea>
    </section>
    <footer>
        <a class="likeBtn" href="index.php?page=2">
            Авторизация
        </a>
        <button type="submit" name="send" <?=($hidden == true) ? 'disabled' : ''?>>
            Отправить
        </button>
        <button type="reset">
            Отмена
        </button>
    </footer>
</form> */ -->

<?
    $headerM = new FormHeader("Добро пожаловать!");
    $sectionM = new FormSection('<textarea rows="3" name="message"></textarea>');

    $toAuthorize = new Button("a", "Авторизация", "", "", "index.php?page=2");
    $Send = new Button("submit", "Отправить", "send", (!isset($_SESSION['login'])));
    $Reset = new Button("reset", "Отмена");

    $footerM = new FormFooter($toAuthorize, $Send, $Reset);

    $FormM = new Form("index.php?page=1", "POST", $headerM, $sectionM, $footerM);


    $query = "SELECT DISTINCT date, CONCAT(`users`.`Name`, ' ', `users`.`SurName`) as fio, message
    FROM `users`
    JOIN `usermessage` ON `users`.`id` = `usermessage`.`id_user`
    JOIN `messages` ON `messages`.`id` = `usermessage`.`id_mess`";
    $result = mysqli_query($connection, $query);
    $Table1 = new Table(["Дата", "Пользователь", "Сообщение"]);
    while ($row = mysqli_fetch_assoc($result))
    {
        $mes = new Message($row['date'], $row['fio'], $row['message']);
        $Table1->addToTable($mes);
    }


    if (isset($_POST["send"])) {
        date_default_timezone_set('Asia/Novosibirsk');
        $mes = new Message(date("Y-m-d H:i:s"), $_SESSION['user'], ($_POST["message"]));

        $pdo = new PDO('mysql:host=localhost;dbname=guestbook', 'root', '');
        $query = "INSERT INTO messages VALUES (NULL, :message, :date)";
        $message = $pdo->prepare($query);
        $message->execute(['message' => $_POST['message'], 'date' => date('Y-m-d H:i:s')]);
        $message_id = $pdo->LastInsertID();

        $query = "INSERT INTO usermessage VALUES (:id_user, :id_mess)";
        $message = $pdo->prepare($query);
        $message->execute(['id_user' => $_SESSION['login_id'], 'id_mess' => $message_id]);

        $Table1->addToTable($mes);
    }

    $FormM->showForm();
    $Table1->showTable();
?>

