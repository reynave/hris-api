<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PERMOHONAN KEMITRAAN DISTRIBUTOR SEWA BERSAMA PIRANTI LUNAK</title>
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
            background-color: #806000;
            color: #fff;
        }

        h4,
        h3 {
            padding: 0px;
            margin: 0px;
        }

        li {
            font-size: 12px;
            line-height: 120%;
        }

        .border-4 {
            border-color: #000 !important;
        }
        .border-bottom-dark {
            border-bottom: 2px solid #000 !important;
        }

        .border-dark {
            border: 1px solid #000 !important;
        }
    </style>
</head>



<body>
    <div class="container">
        <div class="row mb-2">
            <div class="col-3">
                <img src="<?php echo base_url() ?>public/img/kitaro21robot.jpg" width="100%">
            </div>
            <div class="col-9 text-center">
                <h2>PT KITARO TAKARA INTERNASIONAL</h2>
                <p class="py-0 my-0 lh-1">Divisi Distribusi Piranti Lunak AIR KITARO21</p>
                <small>Jakarta Financial Center, Suite A, Pakuwon Tower Lt.30, Kota Kasablanka, Jakarta 12870</small>
            </div>
        </div>
    </div>

    <div class="mx-5">

        <div class="container"> 
            <div class="row">
                <div class="col-12 mb-2">
                    <div class="border text-center border-4">
                        <h4>" PERMOHONAN KEMITRAAN DISTRIBUTOR SEWA BERSAMA PIRANTI LUNAK"</h4>
                    </div>
                </div>
                <div class="col-6" style="text-align: right;">
                    <h4> No. AIRD :</h4>
                </div>
                <div class="col-6">
                    <h4> 123123123</h4>
                </div>
            </div>

            <div class="row">



                <div class="col-12">
                    Petunjuk Pengisian :

                    <ol>

                        <li>Isi formulir aplikasi ini dengan menggunakan huruf cetak & lengkap, krimkan ke : distributor.kitaro@gmail.com</li>
                        <li> Semua informasi pada formulir aplikasi ini harus diisi dengan benar dan lengkap</li>
                        <li>Isi formulir ini dengan menggunakan pulpen hitam, jangan menggunakan pensil</li>
                        <li>Lampirkan fotocopy KTP & Kartu NPWP (berwarna lebih baik)</li>
                        <li>Setelah diisi lengkap, harap ditandatangani oleh Rekruter/Wholesaler Leader & K-21 Group Head</li>
                    </ol>
 
                    <div class="mb-2 py-1 border-top border-bottom-dark">
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

                <div class="col-6  mb-2">
                    <b>Email</b>
                    <div class="border px-2 bg-light"><?php echo $user['email']; ?></div>
                </div>
                <div class="col-6  mb-2">
                    <b>No. K T P</b>
                    <div class="border px-2 bg-light"><?php echo $user['ktp']; ?></div>
                </div>


                <div class="col-6  mb-2">
                    <b>Tempat dan Tanggal Lahir</b>
                    <div class="border px-2 bg-light"><?php echo $user['place_birthdate'] . ', ' . $user['birthdate']; ?></div>
                </div>
                <div class="col-6  mb-2">
                    <b>No. NPWP</b>
                    <div class="border px-2 bg-light"><?php echo $user['npwp']; ?></div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="text-center bg-blue py-2 mb-2 mt-4">
                        <strong class="py-0 lh-1">INFORMASI REKENING BANK</strong>
                    </div>

                </div>

                <div class="col-6">
                    <table width="100%">
                        <tr>
                            <td width="40%">Nomor Rekening </td>
                            <td class="border-bottom">: <?php echo $user['bank_number']; ?></td>
                        </tr>
                        <tr>
                            <td>Nama Pemilik Rekening</td>
                            <td class="border-bottom">: <?php echo $user['heir_email']; ?></td>
                        </tr>
                    </table>
                </div>

                <div class="col-6">
                    <table width="100%">
                        <tr>
                            <td width="40%">Nama Bank </td>
                            <td class="border-bottom">: <?php echo $user['bank']; ?></td>
                        </tr>
                        <tr>
                            <td>Cabang & Kota </td>
                            <td class="border-bottom">: <?php echo $user['bank_branch']; ?></td>
                        </tr>
                    </table>
                </div>
            </div>


            <div class="row">
                <div class="col-12">
                    <div><b>PERNYATAAN</b></div>
                </div>
                <div class="col-12">
                    <ol>
                        <li>
                            Dengan ini saya menyatakan bahwa semua data yang tercantum dalam Permohonan ini adalah benar dan saya mengizinkan
                            Perusahaan untuk mengadakan pengecekan langsung terhadap kebenaran data-data yang saya berikan
                        </li>
                        <li>
                            Saya setuju menjadi Distributor Artificial Intelligent Robot (AIR) Kitaro21 di Group yang merekomendasikan saya dan dengan ini
                            saya menyatakan bahwa saat ini dan di masa yang akan datang, saya tidak akan menawarkan produk sejenis dengan produk yang
                            dipasarkan oleh Kitaro21, dan bersedia diterminasi apabila ditemukan adanya pelanggaran tersebut.
                        </li>

                        <li>Saya berjanji untuk mentaati dan mematuhi semua persyaratan - persyaratan dan peraturan - peraturan sebagai seorang
                            Distributor atau Wholesaler yang berlaku di Perusahaan, termasuk namun tidak terbatas dalam hal kewajiban saya untuk menjaga
                            reputasi Perusahaan dan kualitas pelayanan saya kepada pelanggan. </li>


                        <li>
                            Saya menyatakan telah mengerti atas harga diskonto yang akan saya terima sehubungan dengan kemitraan ini sebagaimana telah
                            dijelaskan oleh Wholesaler Leader saya, dan saya menyatakan telah menyetujui untuk menerima kerjasama Kemitraan ini</li>


                        <li>
                            Dengan ini saya menyatakan bahwa saya bertanggung jawab penuh atas semua aktivitas pemasaran yang akan saya lakukan, dan
                            membebaskan PT Kitaro Takara Internasional dari segala tuntutan hukum di kemudian hari yang diakibatkan oleh kelalaian atau
                            kesalahan yang sengaja dan/atau tidak sengaja saya lakukan dalam memberikan penjelasan dan risiko atas penggunaan produk
                            piranti lunak Kitaro yang saya pasarkan sebagaimana dipersyaratkan oleh Perusahaan sebagai seorang Distributor. Bilamana di
                            kemudian hari ditemukan pelanggaran yang saya lakukan atas butir No.1, 2,3 dan 4 di atas serta hukum yang berlaku di Negara RI,
                            maka saya bersedia menerima pemutusan sepiahk atas Kemitraan ini tanpa tuntutan apapun kepada Perusahaan.</li>

                    </ol>
                </div>

                <div class="">
                    <p>
                        Permohonan sebagai Distributor Sewa Guna Bersama Piranti Lunak KITARO21 ini saya ajukan pada hari dan tempat di :
                    </p>

                    <p>
                        Jakarta, pada tanggal <?php echo date("d - M - Y", strtotime($account['update_date'])); ?><Br>
                    </p>
                </div>


                <div class="row">

                    <div class="col text-center">
                        <div>
                            <b>Distributor (Pembuat Penryataan)</b>
                        </div>

                        <div style="height: 120px;">
                            <img src="<?php echo $this->db->user . '/' . $user['signatureUrl']; ?>" height="120">
                        </div>

                        <div class="border-bottom border-2"><?php echo $user['name']; ?></div>
                        <div><small>(Nama Jelas & Tanda Tangan))</small></div>
                    </div>
                    <div class="col text-center">
                        <div>
                            <b>Distributor (Pembuat Penryataan)</b>
                        </div>
                        <div style="height: 120px;">
                            <?php if ($parent['signatureUrl']) { ?> <img src="<?php echo $this->db->user . '/' . $parent['signatureUrl']; ?>" height="120"> <?php } ?>
                        </div>

                        <div class="border-bottom border-2"> <?php echo $parent['name'] ?> </div>
                        <div><small>(Nama Jelas & Tanda Tangan)</small></div>
                        <div><small>AIRD : <?php echo $parent['ktp'] ?></small></div>

                    </div>

                    <div class="col text-center">
                        <div>
                            <b>Disetujui oleh</b>
                        </div>
                        <div style="height: 120px;">

                        </div>

                        <div class="border-bottom border-2"> <?php echo $parent['name'] ?> </div>
                        <div>Admin Kantor Pusat </div>

                    </div>

                </div>
            </div>





        </div>
    </div>
</body>

</html>