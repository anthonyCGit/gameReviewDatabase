<!-- TCSS 445 : Autumn 2022 -->
<!-- DB Games: Anthony Carrillo, TM1, TM2, TM3 -->
<!-- Home page that displays general information -->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>DB Games Reviews</title>
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
                    <li class="nav-item active">
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
                    <li class="nav-item">
                        <a class="nav-link" href="tag.php">Game Tags</a>
                    </li>
                    <li class="nav-item tag">
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
            <h1 class="display-3">Homepage</h1>
            <p style="float: left; margin-right: 20px; margin-bottom: 20px; width: 120px;"><img src="icon.png" alt="DB Games Logo" width="100" height="100">
            <p class="lead">DB Games database was designed to catalog games with gamers in mind!</p>
            <pre>We strived to become not only the most extensive and complete game information catalog, but to games each gamer wants to play.
We went beyond just showing "like" games based on the game genre by showing similar games from the user experience.</pre>
            <hr class="my-4">
            <p class="lead">Contact Information</p>
            <pre>Contact us to add a game!

Anthony Carrillo: ajc77@uw.edu
Wei Wei Chien: weiwei88@uw.edu
Lucas Dahl: lucasd12@uw.edu
Alec Dowty: dowtya@uw.edu</pre>
            <hr class="my-4">
            <p class="lead">
                <a class="btn btn-primary btn-lg" href="https://www.youtube.com/watch?v=dQw4w9WgXcQ" role="button">Click Here!</a>
            </p>
        </div>
    </body>
</html>