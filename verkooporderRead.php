<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Verkooporder Read</title>
</head>
<body>
    <?php require 'nav.php'?>
    <div class="content">
        <div class="accountPage">
            <div class="basCard">
                <div class="CardContent">
                    <h1>Read Verkooporder</h1>
                    <p>Zoek verkooporder op ID:</p>
                    <form action="verkooporderSearchId.php" method='POST'>
                        <label for="verkOrdId">ID:</label>
                        <input type="text" id='verkOrdId' name='verkOrdId'>
                        <input type="submit">
                    </form>
                    <?php
                        // require 'database.php';
                        if (isset($_SESSION['result'])) {
                            $result = $_SESSION['result'];
                            echo '<div class=""';
                            echo "Klant ID: " . $result['klantId'] . "<br>";
                            echo "Artikel ID: " . $result['artId'] . "<br>";
                            echo "Datum: " . $result['verkOrdDatum'] . "<br>";
                            echo "Bestelde Aantal: " . $result['verkOrdBestAantal'] . "<br>";
                            echo "Order Status: " . $result['verkOrdStatus'] . "<br>";
                            echo '</div>';
                            // unset the session variable once it's been displayed
                            unset($_SESSION['result']);
                        } else if (isset($_SESSION['searchMsg'])) {
                            echo $_SESSION['searchMsg'];
                            unset($_SESSION['searchMsg']);
                        }
                        ?>
                        <div class="divRead">
                            <p>Dit zijn alle verkooporders gegevens uit de database:</p>
                            <div class="read">
                                <?php 
                                    require 'Verkooporders.php';
                                    $verkOrd1 = new Verkooporders();
                                    $verkOrd1->readVerkooporders();
                                ?>
                                <div class="redirect">
                                    <a href="verkoopCreateForm.php">Create verkooporder</a>
                                </div>
                            </div>
                        <div id="messagePHP"><?php
                            if (isset($_SESSION['message'])) {
                                echo $_SESSION['message'];
                                unset($_SESSION['message']);
                            }
                            ?>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <?php require 'footer.php'?>
</body>
<style>
    
input {
    margin-bottom: 5px;
    width: 200px;
    padding: 10px 15px;
    display: flex;
    justify-content: center;
    border-radius: 5px;

}

#messagePHP {
    color: white;
}

a {
    margin: 5px;
    padding: 5px;
    border-radius: 5px;
}
a:hover {
    background-color: white;
    color: black;
}
.CardContent {
    padding: 10px;
    margin: 10px;
}

</style>

<script>
</script>
</html>