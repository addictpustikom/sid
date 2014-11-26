function edit(column, data) {
    if (column == "nama_dosen") {
        editNamaDosen(column, data);
    }
}

function editNamaDosen(column, data) {
    $.ajax({
        url: "model/edit/data_diri/m_e_data_diri.php",
        type: "POST",
        data: {
            "column": column, // kolom database yang hendak di-update
            "data": data // data update-nya
        },
        success: function(result) {
            read_data_dosen();
            $(".loader").fadeOut("slow");
        }
    });
}