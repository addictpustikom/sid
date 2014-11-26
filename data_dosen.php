<?php
session_start();
require_once 'model/koneksi.php';
$nidn = $_SESSION['nidn'];
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Data Dosen :: Sistem Informasi Dosen</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- DATA TABLES -->
        <link href="css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/jQueryUI/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" type="text/css"/>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="skin-dark-green">
        <div class="loader"></div>
        <?php
        require_once 'header.php';
        ?>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <?php
            require_once 'navigasi.php';
            ?>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">    

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-body table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <tbody>
                                            <?php
                                            $query = "SELECT * FROM dosen, program_studi WHERE dosen.nidn='$nidn' AND dosen.kode_program_studi=program_studi.kode_program_studi";
                                            $stmnt = $dbh->prepare($query);
                                            $stmnt->execute();
                                            while ($row = $stmnt->fetch()) {
                                                ?>
                                                <tr>
                                                    <td class="col-md-2" style="font-weight: bold;">Nama</td>
                                                    <td class="col-md-10 nama_dosen"><?php echo $row['nama_dosen']; ?></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-2" style="font-weight: bold;">NIDN</td>
                                                    <td class="col-md-10 nidn"><?php echo $nidn; ?></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-2" style="font-weight: bold;">NIP</td>
                                                    <td class="col-md-10 nip_baru"><?php echo $row['nip_baru']; ?></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-2" style="font-weight: bold;">Program Studi</td>
                                                    <td class="col-md-10 nama_program_studi"><?php echo $row['nama_program_studi']; ?></td>
                                                </tr>
                                            <?php } ?>
                                        </tbody>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                    </div>
                </section><!-- /.content -->
            </aside><!-- /.right-side -->

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <!-- left column -->
                        <div class="col-md-12">
                            <!-- Custom Tabs (Pulled to the right) -->
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs pull-right">
                                    <li id="c3"><a href="#tab_3-3" data-toggle="tab">Status</a></li>
                                    <li id="c2"><a href="#tab_2-2" data-toggle="tab">Jabatan Akademik</a></li>
                                    <li id="c1" class="active"><a href="#tab_1-1" data-toggle="tab">Data Diri</a></li>
                                    <li class="pull-left header"><i class="fa fa-th"></i> Data Dosen</li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade in active" id="tab_1-1">
                                        <?php
                                        $get_data_diri = "SELECT * from `dosen` WHERE nidn='$nidn'";
                                        $data_diri = $dbh->prepare($get_data_diri);
                                        $data_diri->execute();
                                        while ($row = $data_diri->fetch()) {
                                            ?>
                                            <div class="form-group">
                                                <label>NIDN</label>
                                                <input type="text" class="form-control editable_input_text" name="nidn" value="<?php echo $row['nidn']; ?>">
                                            </div>
                                            <div class="form-group">
                                                <label>Nama</label>
                                                <input type="text" class="form-control editable_input_text" name="nama_dosen" value="<?php echo $row['nama_dosen']; ?>">
                                            </div>
                                            <div class="form-group">
                                                <label>Gelar Akademik Depan</label>
                                                <select class="form-control">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                    <option>option 5</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Gelar Akademik Belakang</label>
                                                <select class="form-control">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                    <option>option 5</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>NIP LAMA</label>
                                                <input type="text" class="form-control editable_input_text" name="nip_lama" value="<?php echo $row['nip_lama'] ?>">
                                            </div>
                                            <div class="form-group">
                                                <label>NIP BARU</label>
                                                <input type="text" class="form-control editable_input_text" name="nip_baru" value="<?php echo $row['nip_baru'] ?>">
                                            </div>

                                            <div class="form-group">
                                                <label>No KTP</label>
                                                <input type="text" class="form-control" placeholder="Masukkan No KTP">
                                            </div>
                                            <div class="form-group">
                                                <label>Jenis Kelamin</label>
                                                <select class="form-control">
                                                    <option value="L" <?php
                                                    if ($row['jenis_kelamin'] == "L") {
                                                        echo 'selected="selected"';
                                                    }
                                                    ?>>Laki-laki</option>
                                                    <option value="P" <?php
                                                    if ($row['jenis_kelamin'] == "P") {
                                                        echo 'selected="selected"';
                                                    }
                                                    ?>>Perempuan</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Tempat Lahir</label>
                                                <select class="form-control">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                    <option>option 5</option>
                                                </select>
                                            </div>
                                            <!-- Date dd/mm/yyyy -->
                                            <div class="form-group">
                                                <label>Tanggal Lahir</label>
                                                <div class="input-group">
                                                    <input type="text" id="tanggal_lahir" name="tanggal_lahir" class="form-control editable_input_text" value="<?php echo $row['tanggal_lahir']?>"/>
                                                </div><!-- /.input group -->
                                            </div><!-- /.form group -->
                                            <div class="form-group">
                                                <label>Alamat</label>
                                                <input type="text" class="form-control" plceholder="Masukkan Alamat">
                                            </div>
                                            <div class="form-group">
                                                <label>Kota</label>
                                                <select class="form-control">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                    <option>option 5</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Provinsi</label>
                                                <select class="form-control">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                    <option>option 5</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Kode Pos</label>
                                                <select class="form-control">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                    <option>option 5</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Kode Negara</label>
                                                <select class="form-control">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                    <option>option 5</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Telepon</label>
                                                <input type="text" class="form-control editable_input_text" name="telepon" value="<?php echo $row['telepon']; ?>">
                                            </div>
                                            <div class="form-group">
                                                <label>Hp</label>
                                                <input type="text" class="form-control editable_input_text" name="hp" value="<?php echo $row['hp']; ?>">
                                            </div>
                                            <div class="form-group">
                                                <label>Alamat E-mail</label>
                                                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Masukkan E-mail">
                                            </div>
                                        <?php } ?>
                                    </div><!-- /.tab-pane -->
                                    <div class="tab-pane fade" id="tab_2-2">
                                        <form>
                                            <!-- select -->
                                            <div class="form-group">
                                                <label>Kode Fakultas</label>
                                                <select class="form-control">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                    <option>option 5</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Kode Jurusan</label>
                                                <select class="form-control">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                    <option>option 5</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Kode Perguruan Tinggi</label>
                                                <select class="form-control">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                    <option>option 5</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Golongan</label>
                                                <select class="form-control">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                    <option>option 5</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Pangkat</label>
                                                <select class="form-control">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                    <option>option 5</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Jabatan Fungsional</label>
                                                <input type="text" class="form-control" placeholder="Masukkan Jabatan Fungsional">
                                            </div>
                                            <div class="form-group">
                                                <label>Jabatan Struktural</label>
                                                <input type="text" class="form-control" placeholder="Masukkan Jabatan Struktural">
                                            </div>
                                            <div class="form-group">
                                                <label>Kode Jabatan Akademik</label>
                                                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Masukkan Kode Jabatan">
                                            </div>
                                        </form>
                                        <div class="form-group">
                                            <button class="btn-success">Selanjutnya</button>
                                        </div>
                                    </div><!-- /.tab-pane -->
                                    <div class="tab-pane fade" id="tab_3-3">
                                        <form>
                                            <div class="form-group">
                                                <label>Status Aktif</label>
                                                <select class="form-control">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                    <option>option 5</option>
                                                </select>
                                            </div>
                                            <!-- Date dd/mm/yyyy -->
                                            <div class="form-group">
                                                <label>Mulai Masuk</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input type="text" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
                                                </div><!-- /.input group -->
                                            </div><!-- /.form group -->
                                            <div class="form-group">
                                                <label>Mulai Semester</label>
                                                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Mulai Semester">
                                            </div>
                                            <div class="form-group">
                                                <label>Kode Jenjang Pendidikan</label>
                                                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Masukkan Kode Jenjang Pendidikan">
                                            </div>

                                            <div class="form-group">
                                                <label>Ikatan Kerja</label>
                                                <select class="form-control">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                    <option>option 5</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Akta dan Ijin Mengajar</label>
                                                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Masukkan Akta dan Ijin Mengajar">
                                            </div>

                                            <div class="form-group">
                                                <label>No Sertifikasi Dosen</label>
                                                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Masukkan No Sertifikasi Dosen">
                                            </div>
                                            <!-- Date dd/mm/yyyy -->
                                            <div class="form-group">
                                                <label>Tanggal Keluar Sertifikasi Dosen</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input type="text" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
                                                </div><!-- /.input group -->
                                            </div><!-- /.form group -->
                                            <div class="form-group">
                                                <label>Status Validasi</label>
                                                <select class="form-control">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                    <option>option 5</option>
                                                </select>
                                            </div>
                                        </form>
                                        <div class="form-group">
                                            <button class="btn-success">Simpan</button>
                                        </div>
                                    </div>
                                </div><!-- /.tab-content -->
                            </div><!-- nav-tabs-custom -->
                        </div><!-- /.col -->
                    </div> <!-- /.row -->
                    <!-- END CUSTOM TABS -->
                    </div>
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="js/jquery-2.0.2.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
        <script src="js/style.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="js/AdminLTE/app.js" type="text/javascript"></script>
        <!-- Controllers' scripts -->
        <script src="controller/read/c_r_data_dosen.js" type="text/javascript"></script>
        <script src="controller/edit/data_diri/c_e_data_diri.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#tanggal_lahir").datepicker({
                    dateFormat: "yy-mm-dd",
                    changeYear: true,
                    changeMonth: true,
                    yearRange: "1950:1992"
                });
                $("#tanggal_lahir").on("change", function(){
                    //alert($(this).val());
                });
            });
        </script>

    </body>
</html>