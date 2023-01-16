<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulir Permohonan Sewa Guna Bersama - ver 1.0</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <style>
        @media print {
            body {
                margin: 5px 30px;
            }

            .pagebreak {
                clear: both;
                page-break-after: always;
            }
        }

        *,
        p {
            font-size: 12px;
        }

        .bg-blue {
            background-color: #002060;
            color: #fff;
        }

        li {
            font-size: 12px;
            line-height: 120%;
        }
    </style>
</head>
onload="print();"
<body>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="text-center bg-blue py-2 mb-2">
                    <strong class="py-0 lh-1">Formulir Permohonan Sewa Guna Bersama</strong>
                    <h4 class="py-0 lh-1">Virtual Personal Server & AIR KITARO A</h4>
                </div>

            </div>

            <div class="col-12">
                Petunjuk Pengisian :

                <ol>
                    <li>Isi formulir aplikasi ini dengan menggunakan huruf cetak, ditandatangani di atas meterai Rp 10.000,-</li>
                    <li>Semua informasi pada formulir aplikasi ini harus diisi dengan benar dan lengkap</li>
                    <li>Isi formulir ini dengan menggunakan pulpen hitam, jangan menggunakan pensil</li>
                    <li>Lampirkan fotocopy KTP dan Kartu Keluarga (bila mencantumkan nama Ahli Waris)</li>
                    <li>Setelah diisi lengkap kirimkan via Distributor/Pemberi Referensi untuk dikirimkan ke Admin Dept - Kantor Pusat Kitaro21</li>
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
                <div class="text-center bg-blue py-2 mb-2 mt-4">
                    <strong class="py-0 lh-1">INFORMASI AHLI WARIS</strong>
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
            <div class="col-12">
                <div><b>PERNYATAAN PRIBADI</b></div>
            </div>

            <div class="col-12">
                <ol>
                    <li class="mb-2">
                        Dengan menandatangani Formulir Permohonan Sewa Guna Bersama ini, maka saya menyatakan telah sepenuhnya mengerti maksud dan tujuan
                        sewa bersama dan pemakaian bersama Vitual Personal Server (VPS) dan AIR milik PT Kitaro Takara Internasional (KITARO21) untuk memberikan
                        hak penuh kepada KITARO21 dalam hal mewakili saya untuk menjalankan semua transaksi e-Trading saya pada akun Broker yang akan saya pilih
                        sendiri dan saya pergunakan untuk bertransaksi, oleh karenanya saya dengan ini menyatakan untuk membebaskan KITARO21 dari segala akibat
                        yang ditimbulkan oleh transaksi Aritificial Intelligent Robot (AIR) milik KITARO21, karena saya telah sepenuhnya memahami bahwa hasil masa lalu
                        tidak senantiasa mencerminkan hasil yang akan diperoleh di masa kini dan masa mendatang
                    </li>
                    <li class="mb-2">
                        Saya menyatakan persetujuan saya untuk memilih Paket Sewa VPS untuk E-Trading mata uang GBP/AUD sebagai berikut :

                        <div class="row mb-2">
                            <div class="col-4">
                                <div class="border text-center">
                                    <div class="bg-blue  py-1">
                                        <b>Jenis Permohonan Sewa</b>
                                    </div>
                                    <div class="py-1"><b>Perdana</b></div>
                                </div>

                            </div>
                            <div class="col-4">
                                <div class="border  text-center">
                                    <div class="bg-blue  py-1">
                                        <b>Jenis Paket Sewa Perdana</b>
                                    </div>
                                    <div class="py-1"><b><?php echo $this->model->select("name", "kitaro_vps", "id=" . $user['idVps']); ?></b></div>
                                </div>

                            </div>
                            <div class="col-4">
                                <div class="border  text-center">
                                    <div class="bg-blue  py-1">
                                        <b>Kapasitas Trading Awal</b>
                                    </div>
                                    <div class="py-1"><b>USD <?php echo number_format($transaction['unit'] * 1000); ?></b></div>
                                </div>


                            </div>



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
                                        <td> B. Jumlah unit VPS & AIR K-21 yang disewa </td>
                                        <td class="text-center"> <strong><?php echo $transaction['unit']; ?> UNIT </strong> </td>
                                    </tr>
                                    <tr>
                                        <td> C. Total Biaya Sewa (USD <?php echo $this->model->select("price", "kitaro_price", "id='" . $user['idPrice'] . "' ") ?>) </td>
                                        <td class="text-center"><strong> USD <?php echo number_format($transaction['totalUsd']); ?></strong> </td>
                                    </tr>

                                    <tr>
                                        <td class="text-center">
                                            <strong>TOTAL PEMBAYARAN </strong> (Kurs 1 USD = IDR <?php echo number_format($transaction['currency']); ?>,-)
                                        </td>
                                        <td class="text-center"><strong>USD <?php echo number_format($transaction['totalUsd'] + $transaction['fee']); ?></strong></td>
                                    </tr>
                                </table>

                                <small class="small">
                                    <em>* Keterangan A : Biaya Registrasi User Penyewa Baru hanya dikenakan 1x di saat registrasi, tidak dikenakan untuk Top Up berikutnya</em></small>


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

                                <ul>
                                    <li> <em>Sesuai dengan Peraturan BI No.17/3/PBI/2015, semua transaksi dalam negeri harus dilakukan dalam mata uang Rupiah (IDR)</em> </li>
                                    <li><em>Bukti Transfer Bank & fotocopy KTP dikirimkan terlebih dahulu beserta scan Formulir ini ke : customer.kitaro@gmail.com</em></li>
                                </ul>
                            </div>
                        </div>

                    </li>

                    <li class="mb-2">
                        <div class="pagebreak"> </div>
                        <div class="mb-2">
                            Saya telah memahami bahwa penggunaan Artificial Intelligent Robotic Kitaro21 tidak menjanjikan tingkat keuntungan tertentu kepada saya, dan untuk itu saya bersedia membuat Surat Pernyataan sebagai tambahan atas Permohonan ini bahwa saya memahami risiko atas penggunaan AIR K-21
                        </div>


                        <div class="row">
                       


                            <div class="col-3 offset-9 text-center"> 
                                <div>
                                Jakarta, <?php echo date("d-M-Y", strtotime($account['input_date'])); ?><Br>
                                    <b>Pemberi Kuasa,</b>
                                </div>

                                <div style="min-height: 140px;">
                                    <img src="<?php echo $this->db->user . '/' . $user['signatureUrl']; ?>" width="100%">
                                </div>

                                <div class="border-bottom"><?php echo $user['name']; ?></div>
                                <div><small>(Nama Jelas & Tanda Tangan))</small></div>
                            </div>
                            <!-- <div class="col text-center">
                                <div>
                                    <b>Pemberi Kuasa,</b>
                                </div>
                                <div style="min-height: 140px;">
                                    <img src="<?php echo $this->db->user . '/' . $parent['signatureUrl']; ?>" width="100%">
                                </div>

                                <div class="border-bottom"> <?php echo $parent['name'] ?> </div>
                                <div><small>(Nama Jelas & Tanda Tangan)</small></div>
                            </div>

                            <div class="col text-center">
                                <div>
                                    <b>Wholesaler & Kode Wholesaler</b>
                                </div>
                                <div style="min-height: 140px;">
                                    <img src="<?php echo $this->db->user . '/' . $wholesaler['signatureUrl']; ?>" width="100%">
                                </div>

                                <div class="border-bottom"> <?php echo $wholesaler['name'] ?></div>
                                <div><small>(Nama Jelas & Tanda Tangan)</small></div>
                            </div> -->
                        </div>
                    </li>
                </ol>
            </div>
        </div>





    </div>
</body>

</html>