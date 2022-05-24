$('#example1').DataTable({
    responsive: true,
    ordering: true,
    //order: [[1, "DESC"]],
    columnDefs: [
        { width: "15%", targets: 3, className: "dt-center text-center", "orderable": false },
        { width: "5%", targets: 0 }
    ],
    language: {
        url: "//cdn.datatables.net/plug-ins/1.10.19/i18n/Thai.json"
    },
    ajax: {
        url: '/Brand/LoadData',
        dataSrc: ""

    },
    columns: [
        { data: "Number" },
        { data: "BrandName" },
        { data: "CategoryName" },
        {
            data: "BrandID",
            render: function (data, type, row, meta) {

                const edit = `<button onclick="edit('${row.BrandID}','${row.BrandName}','${row.categoryID}')" class="btn btn-xs btn-default" type="button" data-toggle="tooltip" data-placement="top"   title="แก้ไขข้อมูลผู้ใช้"><i class="fas fa-edit"></i></button>`;
                const del = `<button onclick="Del('${row.BrandID}','${row.BrandName}')" class="btn btn-xs btn-default" type="button" data-toggle="tooltip" title="ลบข้อมูลผู้ใช้"><i class="ion-close"></i></button>`;
                const start = `<div class="btn-group">`;
                const end = `</div>`;
                $(function () {
                    $('[data-toggle="tooltip"]').tooltip();
                });
                return start + edit + del + end;


            }
        }
    ]

});


function Del(id, name) {
    $.confirm({
        title: 'แจ้งเตือน คุณจะลบข้อมูลหรือไม่!',
        content: `${name}`,
        type: 'red',
        typeAnimated: true,
        buttons: {
            confirm: {
                text: 'ตกลง',
                btnClass: 'btn-red',
                action: function () {
                    $.ajax({
                        type: "POST",
                        url: "/Brand/Delete",
                        data: { id: id },
                        success: function (result) {
                            if (result === true) {
                                var table1 = $('#example1').DataTable();
                                table1.ajax.reload();
                                toastr.info('แจ้งเตือน, ลบข้อมูลเรียบร้อย.')
                            } else {
                                alert(result);
                            }
                        }
                    });
                }
            },
            cancel: {
                text: 'ปิด'
            }
        }
    });

}
loadFunc();

function loadFunc() {
    var ID = document.getElementById("brandID").value;
    if (ID !== "0") {
        document.getElementById("btnsubmit").innerHTML = "ยืนยันการแก้ไข";
        $("#btnedit").show();
    } else {

        $("#btnedit").hide();
        $("#categoryID").val(null);
    }

}
function edit(id, name, categoryID) {
    document.getElementById("brandID").value = id; 
    document.getElementById("brandName").value = name;
    $('#categoryID').val(categoryID);
    loadFunc();
}
$("#btnedit").click(function () {

    document.getElementById("btnsubmit").innerHTML = "ยืนยัน";
    document.getElementById("brandID").value = 0;
    document.getElementById("brandName").value = "";
    $("#categoryID").val(null);
    loadFunc();
});
$(document).ready(function () {
    $(document).on('submit',
        '#addcat',
        function (e) {
            e.preventDefault();
            $.ajax({
                    url: '/Brand/Create',
                    method: 'POST',
                    data: new FormData(this),
                    contentType: false,
                    processData: false,
                    success: function (data) {
                        if (data === true) {
                            var table2 = $('#example1').DataTable();
                            table2.ajax.reload();
                            document.getElementById("brandID").value = 0;
                            document.getElementById("brandName").value = "";
                            loadFunc();
                            toastr.success('แจ้งเตือน, บันทึกข้อมูลเรียบร้อย.');
                        } else {
                            alert(data);
                        }

                    }
                },
                'json');
        });

});

$(document).ready(function () {
    $('#addcat').validate({
        errorElement: 'div',
        //errorPlacement: function(error, e) {
        //    e.parents('.form-group > div').append(error);
        //},
        highlight: function (e) {

            $(e).closest('.form-group').removeClass('has-success   text-danger ').addClass('text-danger ');

            $(e).closest('.form-control').removeClass('input-validation-error  ')
                .addClass('input-validation-error ');

            $(e).closest('.help-block').remove();
        },
        success: function (e) {
            e.closest('.form-group').removeClass('has-success text-danger');
            $('.form-control').removeClass('input-validation-error ');
            e.closest('.help-block').remove();
        },
        rules: {
            'brandName': {
                required: true,
                minlength: 2,
                maxlength: 50
            },
            'categoryID': {
                required: true
            }
        },
        messages: {
            'brandName': {
                required: 'กรุณากรอกชื่อประเภท',
                minlength: jQuery.validator.format("กรุณาใส่ข้อมูลมากกว่า {0} ตัวอักษร"),
                maxlength: jQuery.validator.format("กรุณาใส่ข้อมูลน้อยกว่า {0} ตัวอักษร")
            },
            'categoryID': {
                required: 'กรุณาเลือกหมวดหมู่'
            }
        }
    });
});