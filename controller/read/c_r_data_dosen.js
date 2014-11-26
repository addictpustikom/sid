function read_data_dosen() {
    $.ajax({
        url: "model/read/m_r_data_dosen.php",
        type: "GET",
        success: function(result) {
            var datas = JSON.parse(result);
            for (var data in datas) {
                $(".nama_dosen").html(datas[data].nama);
                $(".nidn").html(datas[data].nidn);
                $(".nip_baru").html(datas[data].nip);
                $(".nama_program_studi").html(datas[data].prodi);
            }
        }
    });
}