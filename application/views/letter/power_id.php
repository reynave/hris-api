<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Surat Kuasa ver 1.0</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <style>
        @media print {

            body {
                margin: 10px 30px;
            }

        }

        ol li{
            margin-bottom: 10px;
        }
    </style>
</head>

<body onload="print();">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h4 class="my-4 text-center">SURAT KUASA</h4>
            </div>

            <div class="col-12">
                <p>Saya yang bertanda tangan di bawah ini :</p>
                <table class="mb-3 table table-sm">
                    <tr>
                        <td width="150">Nama Lengkap</td>
                        <td width="10">:</td>
                        <td><div> <?php echo ucwords($user['name']);?> </div></td>
                    </tr>
                    <tr>
                        <td>NIK (KTP)</td>
                        <td>:</td>
                        <td> <div> <?php echo $user['ktp'];?> </div> </td>
                    </tr>
                    <tr>
                        <td>Alamat</td>
                        <td>:</td>
                        <td> <div> <?php echo $user['address'].', '.$user['city'].' '.$user['postal_code'];?> </div> </td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>:</td>
                        <td><div> <?php echo $user['email'];?> </div></td>
                    </tr>
                </table>


                <p>Selaku Penyewa Robot KITARO21, dengan ini memberikan KUASA KHUSUS kepada PT Kitaro Takara
                    Internasional (KITARO21) atau yang mewakilinya dengan hak substitusi selaku Pihak Pemilik dan Operator
                    Robot KITARO21 untuk mewakili saya dalam hal melakukan kegiatan Trading di pasar Forex melalui platform
                    Meta Trader-4 dan/atau Meta Trader-5. Oleh karenanya, saya secara sadar dan tanpa paksaan dari Pihak
                    manapun memberikan informasi atas Nomor MT-4 (MT-5) Login, Nama Server, Password Trading dan Nama
                    Broker yang telah saya pilih sendiri, agar pelaksanaan Trading Forex untuk akun saya dapat dilaksanakan.</p>


                <p>Hal-hal lainnya sebagaimana diuraikan di bawah ini juga telah saya pahami dan setujui, yakni bahwa :</p>


                <ol>
                    <li>
                        Saya sepenuhnya memahami bahwa Pemilik dan Operator KITARO21 tidak pernah menjanjikan untuk
                        memberikan tingkat keuntungan tertentu kepada saya, dan dalam hal ini saya memahami dan
                        menerima resiko untung atau rugi yang akan terjadi sehubungan dengan penggunaan Robot KITARO21,
                        karena saya mengerti bahwa kinerja masa lalu tidak mencerminkan kinerja masa kini dan masa depan.
                        Oleh karenanya, sebagai penyewa dan/atau pengguna Robot KITARO21, saya siap menanggung risiko
                        untung dan rugi akibat penggunaan Robot KITARO21 dengan segala aktivitas yang dilakukan Robot
                        KITARO21 di dalam akun trading saya, tanpa menyalahkan siapapun termasuk tidak akan menuntut
                        pembuat, pemilik atau operator Robot KITARO21 untuk menanggung kerugian yang saya alami, dan
                        karenanya Pemilik dan Operator Robot KITARO21 dibebaskan dari segala kerugian dan tuntutan hukum
                        atas penyewaan Robot KITARO21 sebagai Expert Advisor dari Trading Forex yang saya lakukan di Broker
                        yang saya tentukan dan pilih sendiri.
                    </li>

                    <li>
                        Saya memahami bahwa selama Robot KITARO21 dipasang pada akun trading saya, maka saya berjanji
                        tidak akan melakukan tindakan interupsi atas transaksi yang sedang berjalan, baik Open Position
                        dan/atau Close Position termasuk namun tidak terbatas kepada orang lain yang memiliki akses kepada
                        akun trading saya. Jika hal ini terjadi, maka saya sepenuhnya akan bertanggung jawab atas tindakan
                        tersebut dan membebaskan Robot KITARO21 dari segala resiko kerugian dan tuntutan atas kelalaian
                        saya tersebut. Dan selanjutnya, saya akan menerima konsekuensi diberhentikannya fungsi Robot
                        KITARO21 pada akun trading saya dan Hak Sewa atas Robot KITARO21 menjadi hangus, dan bilamana
                        saya menginginkan aktivasi kembali, maka saya wajib menyewa Robot yang baru sesuai harga sewa
                        Robot KITARO21 yang berlaku pada saat itu
                    </li>

                    <li>
                        Sebagai Penyewa Robot KITARO21, saya memahami dan berjanji untuk menyampaikan pemberitahuan
                        tertulis via email kepada Admin KITARO21 apabila saya hendak melakukan penarikan dana yang
                        berlebihan (selain profit trading) sehingga mengurangi jumlah Deposit Awal saya, agar Robot KITARO21
                        dapat melakukan penyesuaian pada transaksi berikutnya setelah dana saya Tarik (withdrawal).
                    </li>

                    <li>
                        Saya memahami dan berjanji untuk menyampaikan pemberitahuan tertulis via email kepada Admin
                        KITARO21 apabila saya hendak melakukan penambahan dana (Top Up) pada akun trading saya dan
                        membayar tambahan biaya sewa Robot baru sesuai kapasitas tambahan Deposit yang akan saya
                        lakukan, agar Robot KITARO21 dapat melakukan penyesuaian pada transaksi berikutnya setelah dana
                        deposit baru saya setorkan ke akun trading pada Broker.

                    </li>

                    <li>
                        Atas butir 3 di atas dan butir 4 ini, maka apabila saya lalai menyampaikan pemberitahuan tertulis
                        kepada KITARO21, maka saya akan menanggung semua akibat dan kerugian finansial yang mungkin
                        timbul karena kelalaian saya tersebut dan membebaskan KITARO21 dari tuntutan apapun.
                    </li>


                    <li>
                        Saya memahami bahwa sebagai Pengguna dan/atau Penyewa KITARO21 akan dikenakan Prosentase
                        PROFIT SHARING (sesuai tabel di bawah ini) dari profit yang diterima sejak hari dan tanggal Surat Kuasa
                        ini saya tandatangani, dimana Profit Sharing yang sudah dibayarkan kepada KITARO21 tidak dapat
                        dikembalikan atau dilakukan substitusi dengan alasan apapun.

                        <img src="<?php echo base_url();?>public/data/agreement20210202.jpg" width="100%">
                    </li>


                    <li>
                        Saya memahami bahwa Profit Sharing akan ditagih oleh KITARO21 setiap bulan pada minggu pertama
                        atas hasil profit trading bulan sebelumnya melalui media surat elektronik (email) yang ditujukan kepada
                        alamat email saya sebagaimana yang saya daftarkan di atas, dan harus saya bayarkan selambatlambatnya pada tanggal 15 setiap bulan atas profit trading bulan sebelumnya sesuai Tabel butir 5 di
                        atas. Apabila tanggal 15 jatuh pada hari libur, maka pembayaran harus saya lakukan pada hari kerja
                        berikutnya, dan apabila pembayaran Hak Profit Sharing milik KITARO21 tidak saya bayarkan tepat
                        waktu, maka saya mengerti bahwa KITARO21 berhak memberhentikan fungsi Robot KITARO21 pada
                        akun trading saya, dan selanjutnya untuk mengaktifkan kembali Robot KITARO21, maka saya harus
                        melakukan pembayaran sewa baru dan melunasi pembayaran Profit Sharing yang masih tertunggak
                        (bila ada) beserta denda administrasi sebesar USD 50,- (lima puluh US Dollar) yang dibayarkan dalam
                        konversi nilai mata uang Rupiah sesuai kurs nilai tukar yang diberlakukan oleh KITARO21.
                    </li>

                    <li>
                        Saya memahami bahwa apabila saya selaku Penyewa Robot tidak mendapatkan profit atas trading
                        dalam bulan tersebut, maka Prosentase Profit Sharing tidak akan ditagihkan oleh Pihak KITARO21.
                    </li>

                    <li>
                        Saya sepenuhnya memahami bahwa atas penggunaan Robot KITARO21 pada rekening Broker yang
                        telah saya pilih sendiri mengandung resiko pasar dan tidak serta merta memberikan keuntungan, oleh
                        karenanya dengan ini SAYA membebaskan dan tidak akan mengambil langkah hukum apapun terhadap
                        PT Kitaro Takara Internasional (KITARO21), para Distributor dan Wholesaler Leader dari Robot
                        KITARO21 atas segala resiko yang terjadi atas transaksi Forex trading saya tersebut.
                    </li>
                </ol>

                <p>
                    Demikianlah SURAT KUASA ini saya buat dengan sebenar-benarnya dalam keadaan sehat, sadar dan tanpa paksaan dari pihak manapun, yang saya buat untuk dapat dipergunakan sebagaimana mestinya.
                </p>

            </div>

            <div class="col">
                <table>
                    <tr>
                        <td>Dibuat di</td>
                        <Td><?php echo $user['city']?></Td>
                    </tr>
                </table>

                <div>
                    <b>Pemberi Kuasa,</b>
                </div>

                <div style="min-height: 200px;">
                <img src="<?php echo $this->db->user.'/'.$user['signatureUrl'];?>" width="300">
                </div>

                <div class="border-bottom"><?php echo $user['name'];?></div>
                <div><small>(Nama jelas & Tanda Tangan Penyewa Robot KITARO21)</small></div>
            </div>
            <div class="col">
                <!-- <table>
                    <tr>
                        <td>Tanggal : </td>
                        <Td><?php echo date("d M Y",strtotime($user['update_date']));?></Td>
                    </tr>
                </table>

                <div>
                    <b>Pemberi Kuasa,</b>
                </div>
                <div style="min-height: 200px;">
                    
                </div>

                <div class="border-bottom"> &nbsp; </div>
                <div><small>(PT. Kitaro Takara Internasional (KITARO21))</small></div> -->
            </div>
        </div>
    </div>
</body>

</html>