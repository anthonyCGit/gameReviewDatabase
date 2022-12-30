<?php require_once('config.php'); ?>
<!-- TCSS 445 : Autumn 2022 -->
<!-- DB Games: Anthony Carrillo, TM1, TM2, TM3 -->
<!-- Displays all used tags for a specified game -->
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
                    <li class="nav-item">
                        <a class="nav-link" href="info.php">Game Info</a>
                    </li>
                    <li class="nav-item active">
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
            <p class="lead">Select a game to get tags for</p>
            <hr class="my-4">
            <form method="GET" action="tag.php">
                <select name="dep" onchange='this.form.submit()'>
                    <option selected>Select a game</option>
                    <?php
                    $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME);
                    if ( mysqli_connect_errno() )
                    {
                        die( mysqli_connect_error() );
                    }
                    // Displays all games to choose
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
                            <th scope="col">Tags</th>
                        </tr>
                    </thead>
                    <?php
                        if ( mysqli_connect_errno() )
                        {
                            die( mysqli_connect_error() );
                        }
                        // Get all tags used for a specified game
                        $sql = " SELECT TAG.Tag AS Tags FROM TAG, REVIEW
                        WHERE REVIEW.GameID = {$_GET['dep']} AND (REVIEW.TagID1 = TAG.TagID OR REVIEW.TagID2 = TAG.TagID OR REVIEW.TagID3 = TAG.TagID) ORDER BY TAG.Tag ASC";
                        if ($result = mysqli_query($connection, $sql))
                        {
                            while($row = mysqli_fetch_assoc($result))
                            {
                    ?>
                    <tr>
                        <td><?php echo $row['Tags'] ?></td>
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