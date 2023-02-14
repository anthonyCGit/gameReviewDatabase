<?php require_once('config.php'); ?>
<!-- TCSS 445 : Autumn 2022 -->
<!-- DB Games: Anthony Carrillo, Wei Wei Chien, Lucas Dahl, Alec Dowty -->
<!-- Displays general information on a specific game -->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Game Reviews</title>
        <!-- add a reference to the external stylesheet -->
        <link rel="stylesheet" href="https://bootswatch.com/4/lux/bootstrap.min.css">
    </head>
    <body>
        <!-- START -- Add HTML code for the top menu section (navigation bar) -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">DB Games Reviews</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarColor02">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.php">Home
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="users.php">User Reviews</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="info.php">Game Info</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="tag.php">Game Tags</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="date.php">Release Dates</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="devrev.php">Developer Top Games</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- END -- Add HTML code for the top menu section (navigation bar) -->
        <div class="jumbotron">
            <p class="lead">Select a game to information on</p>
            <hr class="my-4">
            <form method="GET" action="info.php">
                <select name="dep" onchange='this.form.submit()'>
                    <option selected>Select a game</option>
                    <?php
                    $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME);
                    if ( mysqli_connect_errno() )
                    {
                        die( mysqli_connect_error() );
                    }
                    // Diplays all games
                    $sql = "select GameID, Name from GAME";
                    if ($result = mysqli_query($connection, $sql))
                    {
                        // loop through the data
                        while($row = mysqli_fetch_assoc($result))
                        {
                            echo '<option value="' . $row['GameID'] . '">';
                            echo $row['Name'];
                            echo "</option>";
                        }
                        // release the memory used by the result set
                        mysqli_free_result($result);
                    }
                    ?>
                </select>
                <?php
                if ($_SERVER["REQUEST_METHOD"] == "GET")
                {
                    if (isset($_GET['dep']) )
                    {
                ?>
                <p>&nbsp;</p>
                <table class="table table-hover">
                    <thead>
                        <tr class="table-success">
                            <th scope="col">Game</th>
                            <th scope="col">Release Date</th>
                            <th scope="col">Language</th>
                            <th scope="col">ESRB</th>
                            <th scope="col">Platform</th>
                            <th scope="col">DLC Count</th>
                            <th scope="col">Maximum Players</th>
                        </tr>
                    </thead>
                    <?php
                        if ( mysqli_connect_errno() )
                        {
                            die( mysqli_connect_error() );
                        }
                        // Get all general information for a specified game
                        $sql = " SELECT G.Name AS GName, G.ReleaseDate AS RDate, L.LanguageName AS LName, E.ESRBRating AS ERating, P.PlatformName AS PForm, G.DLCCount AS DLC, G.PlayerCount AS PCount
                        FROM GAME G, LANGUAGE L, ESRB E, PLATFORM P WHERE L.LanguageID = G.LanguageID AND E.ESRBID = G.ESRBID AND P.PlatformID = G.PlatformID AND G.GameID = {$_GET['dep']}";
                        if ($result = mysqli_query($connection, $sql))
                        {
                            while($row = mysqli_fetch_assoc($result))
                            {
                    ?>
                    <tr>
                        <td><?php echo $row['GName'] ?></td>
                        <td><?php echo $row['RDate'] ?></td>
                        <td><?php echo $row['LName'] ?></td>
                        <td><?php echo $row['ERating'] ?></td>
                        <td><?php echo $row['PForm'] ?></td>
                        <td><?php echo $row['DLC'] ?></td>
                        <td><?php echo $row['PCount'] ?></td>
                    </tr>
                    <?php
                            }
                            // release the memory used by the result set
                            mysqli_free_result($result);
                        }
                    } // end if (isset)
                } // end if ($_SERVER)
                    ?>
                </table>
            </form>
        </div>
    </body>
</html>
