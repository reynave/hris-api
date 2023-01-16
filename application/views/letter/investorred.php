<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Virtual Personal Server & AI Robotrade KITARO SAMURAI - ver 1.0</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <style>
        @media print {
            body {
                margin: 0px;
            }

            .pagebreak {
                clear: both;
                page-break-after: always;
            }
        }

        @page {
            size: auto;
            margin: 4mm 4mm;
        }

        *,
        p {
            font-size: 11px;
        }

        .bg-blue {
            background-color: #822a42;
            color: #fff;
        }

        h4 {
            padding: 0px;
            margin: 0px;
        }

        li {
            font-size: 12px;
            line-height: 120%;
           
        }
        ol.aplha li{
            list-style-type: upper-alpha !important;
            line-height: 100%;
        }
        .table{
            margin-bottom: 0px;
        }
        .table tr td{
            margin-bottom: 0px;
            border: 1px solid #000 !important;
        }
        .f01{
            font-size: 10px;
            font-style: italic;
            line-height: 120%;
        }
        h2{
            font-weight: bolder;
        }
        .border-bottom-dark{
            border-bottom: 2px solid #000 !important;
        }
        .border-dark{
            border: 1px solid #000 !important;
        }
    </style>
</head>


<body onload="print();">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="text-center bg-blue py-3 mb-2">
                    <h2 class="py-0 lh-1">Formulir Permohonan Sewa Guna Bersama</h2>
                    <h2 class="py-0 lh-1">Virtual Personal Server & AI Robotrade KITARO SAMURAI</h2>
                </div>

            </div>
        </div>
    </div>
    <div class="px-5">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    Petunjuk Pengisian :

                    <ol>
                        <li>Isi formulir aplikasi ini dengan menggunakan huruf cetak.</li>
                        <li>Semua informasi pada formulir aplikasi ini harus diisi dengan benar dan lengkap.</li>
                        <li>Isi formulir ini dengan menggunakan pulpen hitam, jangan menggunakan pensil.</li>
                        <li>Lampirkan fotocopy KTP dan Kartu Keluarga (bila mencantumkan nama Ahli Waris).</li>
                        <li>Setelah diisi lengkap kirimkan via Distributor/Pemberi Referensi untuk dikirimkan ke Admin Dept - Kantor Pusat Kitaro21.</li>
                    </ol>

                    <hr>



                    <div class="mb-2 py-1 border-bottom">
                        <strong>DATA PRIBADI</strong>
                    </div>
                    <div class="mb-2">
                        <b>Nama Lengkap (Sesuai KTP)</b>
                        <div class="border px-2 bg-light"><?php echo $user['name']; ?></div>
                    </div>
                    <div class="mb-2">
                        <b>Alamat Lengkap (Sesuai KTP)</b>
                        <div class="border px-2 bg-light"><?php echo $user['address']; ?></div>
                    </div>
                </div>
                <div class="col-4 mb-2">
                    <b>Kota</b>
                    <div class="border px-2 bg-light"><?php echo $user['city']; ?></div>
                </div>
                <div class="col-4 mb-2">
                    <b>Kode Pos</b>
                    <div class="border px-2 bg-light"><?php echo $user['postal_code']; ?></div>
                </div>

                <div class="col-4 mb-2">
                    <b>No. Handphone</b>
                    <div class="border px-2 bg-light"><?php echo $user['city']; ?></div>
                </div>

                <div class="col-6">
                    <b>Email</b>
                    <div class="border px-2 bg-light"><?php echo $user['email']; ?></div>
                </div>
                <div class="col-6">
                    <b>No. K T P</b>
                    <div class="border px-2 bg-light"><?php echo $user['ktp']; ?></div>
                </div>

            </div>

            <div class="row">
                <div class="col-12">
                    <div class="text-center bg-blue mb-2 mt-3">
                        <h4 class="py-1 lh-1">INFORMASI AHLI WARIS</h4>
                    </div>

                </div>

                <div class="col-6">
                    <table width="100%">
                        <tr>
                            <td width="40%">Nama Ahli Waris </td>
                            <td class="border-bottom">: <?php echo $user['heir_name']; ?></td>
                        </tr>
                        <tr>
                            <td>Email Ahli Waris</td>
                            <td class="border-bottom">: <?php echo $user['heir_email']; ?></td>
                        </tr>
                    </table>
                </div>

                <div class="col-6">
                    <table width="100%">
                        <tr>
                            <td width="40%">Hubungan </td>
                            <td class="border-bottom">: <?php echo $user['heir_relation']; ?></td>
                        </tr>
                        <tr>
                            <td>No. Handphone </td>
                            <td class="border-bottom">: <?php echo $user['heir_phone']; ?></td>
                        </tr>
                    </table>
                </div>
            </div>


            <div class="row">
                <div class="col-12 ">
                    <div class="border-bottom border-bottom-dark mb-1"><b>PERNYATAAN PRIBADI</b></div>
                </div>
                <div class="col-12">
                    <ol class="aplha">
                        <li class="mb-2">
                           <p>
                           Dengan menandatangani Formulir Permohonan Sewa Guna Bersama ini, maka saya menyatakan telah sepenuhnya mengerti maksud dan
                            tujuan sewa bersama dan pemakaian bersama Vitual Personal Server (VPS) dan AIR milik PT Kitaro Takara Internasional (KITARO<sub>21</sub>) untuk
                            memberikan hak penuh kepada KITARO<sub>21</sub> dalam hal mewakili saya untuk menjalankan semua transaksi e-Trading saya pada akun Broker
                            yang akan saya pilih sendiri dan saya pergunakan untuk bertransaksi, oleh karenanya saya dengan ini menyatakan untuk membebaskan
                            KITARO<sub>21</sub> dari segala akibat yang ditimbulkan oleh transaksi Aritificial Intelligent Robotrade (AIR) milik KITARO<sub>21</sub>, karena saya telah sepenuh-
                            nya memahami bahwa hasil masa lalu tidak senantiasa mencerminkan hasil yang akan diperoleh di masa kini dan masa mendatang
                           </p>
                        </li>
                        <li class="mb-2">
                            
                                <p>
                                Saya menyatakan persetujuan saya untuk memilih Paket Sewa VPS untuk Artificial Intelligent Robotrade (AIR) Kitaro21 sebagai berikut :
                                </p>
                          

                            <div class="row mb-2">
                                <div class="col-4">
                                    <div class="border-dark text-center">
                                        <div class="bg-blue  py-1">
                                            <b>Jenis Permohonan Sewa</b>
                                        </div>
                                        <div class="py-1"><b>Perdana</b></div>
                                    </div>

                                </div>
                                <div class="col-4">
                                    <div class="border-dark  text-center">
                                        <div class="bg-blue  py-1">
                                            <b>Jumlah Robotrade yang disewa</b>
                                        </div>
                                        <div class="py-1">
                                            <h4> <?php echo $transaction['unit'] ?> UNIT</h4>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-4">
                                    <div class="border-dark  text-center">
                                        <div class="bg-blue  py-1">
                                            <b>Jumlah Harga Robotrade SAMURAI</b>
                                        </div>
                                        <div class="py-1">
                                            <h4>USD <?php echo number_format($transaction['unit'] * 1000); ?></h4>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="row mb-2">
                                <div class="col-4">
                                    <div class="border-dark text-center">
                                        <div class="bg-blue  py-1">
                                            <b>Pairing Mata Uang</b>
                                        </div>
                                        <div class="py-1">
                                            <h4>USD</h4>
                                        </div>
                                    </div>

                                </div>

                                <div class="col-8">
                                    <div class="border-dark text-center">
                                        <div class="bg-blue  py-1">
                                            <b>TRADER RISK PROFILE LEVEL</b>
                                        </div>
                                        <div class="py-1">
                                            <h4><?php echo $this->model->select("profile", "kitaro_price", "id='" . $idPrice . "' "); ?></h4>
                                        </div>
                                    </div>

                                </div>
                            </div>


                            <div class="row mb-2">

                                <div class="col-12 mt-2">
                                    <div class="bg-blue p-1 text-center">
                                        <b>Rincian Pembayaran yang harus dilakukan via Transfer Bank</b>
                                    </div>

                                    <table class="table table-sm table-bordered">
                                        <tr>
                                            <td width="50%"> A. Biaya Registrasi User Penyewa Baru (USD <?php echo number_format($transaction['fee']); ?>) </td>
                                            <td class="text-center"> <strong>USD <?php echo number_format($transaction['fee']); ?></strong> ,- (tidak dikenakan untuk Top Up Deposit) </td>
                                        </tr>

                                        <tr>
                                            <td> B. Total harga Sewa Robotrade SAMURAI </td>
                                            <td class="text-center"><strong> USD <?php echo number_format($transaction['totalUsd']); ?></strong> </td>
                                        </tr>

                                        <tr>
                                            <td class="text-center">
                                                <strong>TOTAL JUMLAH PEMBAYARAN </strong>
                                                <!-- (Kurs 1 USD = IDR <?php echo number_format($transaction['currency']); ?>,-) -->
                                            </td>
                                            <td class="text-center"><strong>USD <?php echo number_format($transaction['totalUsd'] + $transaction['fee']); ?></strong></td>
                                        </tr>
                                    </table>

                                    <div class="f01 mb-2">
                                        * Keterangan A : Biaya Registrasi User Penyewa Baru hanya dikenakan 1x di saat registrasi, tidak dikenakan untuk Top Up berikutnya</div>


                                    <table class="table table-sm table-bordered">
                                        <tr>
                                            <td class="text-center" width="50%">
                                                Seluruh pembayaran hanya ditransfer ke rekening :
                                                <div>
                                                    <h5 class="mb-0 lh-1 pb-1">Bank BCA No. 6000 128 129</h5>
                                                    <b> atas nama : PT KITARO TAKARA INTERNASIONAL </b>
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                <div class="border-bottom"><b>Total Transfer Pembayaran via Bank (dalam mata uang Rupiah)</b> </div>
                                                <div><b>IDR <?php echo number_format($transaction['grandTotal']); ?></b> </div>
                                            </td>
                                        </tr>
                                    </table>


                                    <div class="f01">
                                       * Sesuai dengan Peraturan BI No.17/3/PBI/2015, semua transaksi dalam negeri harus dilakukan dalam mata uang Rupiah (IDR)
                                    </div>
                                    <div class="f01">* Bukti Transfer Bank & fotocopy KTP dikirimkan terlebih dahulu beserta scan Formulir ini ke : customer.kitaro@gmail.com</em> 



                                </div>
                            </div>

                        </li>

                        <li class="mb-2">

                            <div class="mb-4">
                                <p>
                                    Saya telah memahami bahwa penggunaan Artificial Intelligent Robotrade Kitaro21 tidak menjanjikan tingkat keuntungan tertentu kepada
                                    saya, dan untuk itu saya bersedia membuat Surat Pernyataan atas Permohonan ini bahwa saya memahami risiko atas penggunaan
                                    AIR KITARO21
                                </p>

                                <p>
                                    <u>  Jakarta </u> / <u> <?php echo date("d - M - Y", strtotime($account['input_date'])); ?></u>
                                </p>
                            </div>


                            <div class="row">

                                <div class="col text-center">
                                    <div>
                                        Penyewa AIR Kitaro21
                                    </div>

                                    <div style="min-height: 100px;">
                                        <img src="<?php echo $this->db->user . '/' . $user['signatureUrl']; ?>" height="100px">
                                    </div>

                                    <div class="border-bottom"><?php echo $user['name']; ?></div>
                                    <div><small>(Nama Jelas & Tanda Tangan))</small></div>
                                </div>
                                <div class="col text-center">
                                    <div>
                                       Nama Distributor & Kode AIRD
                                    </div>
                                    <div style="height:100px">
                                        <?php if ($parent['signatureUrl']) { ?> <img src="<?php echo $this->db->user . '/' . $parent['signatureUrl']; ?>" width="100%"> <?php } ?>
                                    </div>

                                    <div class="border-bottom"> <?php echo $parent['name'] ?> </div>
                                    <div><small>(Nama Jelas & Tanda Tangan)</small></div>
                                    <div><small>AIRD : <?php echo $parent['ktp'] ?></small></div>

                                </div>

                                <div class="col text-center">
                                    <div>&nbsp;</div>
                                    <table class="table table-sm border table-bordered">
                                        <tr>
                                            <td colspan="3" class="text-center">
                                                <small>Diisi oleh Admin Kantor Pusat K-21</small>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="33,3%">
                                                <div style="height: 50px;"></div>
                                            </td>
                                            <td width="33,3%"></td>
                                            <td width="33,3%"></td>

                                        </tr>
                                        <tr>
                                            <td class="text-center"><small>Check 1</small></td>
                                            <td class="text-center"><small>Check 2</small></td>
                                            <td class="text-center"><small>Check 3</small></td>


                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </li>
                    </ol>
                </div>
            </div>





        </div>
    </div>

</body>

</html>