<?php
defined('BASEPATH') or exit('No direct script access allowed');
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PERMOHONAN KEMITRAAN DISTRIBUTOR SEWA BERSAMA PIRANTI LUNAK</title>
    <style rel="stylesheet">
        * {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
        }

        small {
            font-size: 12px;
            color: #666;
        }
    </style>
</head>

<body>
    <p>Dear <?php echo $user['name']; ?></p>
    <br>
    <p>
        Thank you for register as <b>ditributor</b> for KITARO21, your account has been approve by admin<br> 
    </p>

    <table>
        <tr>
            <td> ID Account </td>
            <td>: <?php echo $user['id']; ?> </td>
        </tr>
       
        <tr>
            <td> Email </td>
            <td>: <?php echo $user['email']; ?> </td>
        </tr>

        <tr>
            <td> Approved as   </td>
            <td>: Distributor </td>
        </tr>

    </table>

    
 
    <br>
    <table bgcolor="#DDEEFF" width="100%">
        <thead>
            <tr>
                <td><strong>Auto Generate Letters</strong></td>
            </tr>
        </thead>
        <tbody>
            <Tr>

                <td>
                    <a href="<?php echo base_url(); ?>letter/distributor/?token=<?php echo $token;?>" target="_blank">APPLICATION FOR RENTAL DISTRIBUTOR PARTNERSHIP WITH THE SOFTWARE </a>
                </td>
            </Tr>
           
        </tbody>

    </table>

    <hr>

    <small>This email generated by system, please do not reply to this email</small>
    </p>
</body>

</html>