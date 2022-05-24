
$(document).ready(function () {
    $('#AddMember').validate({
        errorElement: 'div',
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
            'userID': {
                required: true,
                minlength: 5,
                maxlength: 50
            },
            'password': {
                required: true,
                minlength: 10,
                maxlength: 50
            },
            'confirmPassword': {
                required: true,
                minlength: 10,
                maxlength: 50,
                equalTo: "#password"
            },
            'name': {
                required: true,
                minlength: 2,
                maxlength: 50
            },
            'lastname': {
                required: true,
                minlength: 2,
                maxlength: 50
            },
            'address': {
                required: true,
                minlength: 2,
                maxlength: 100
            },
            'district': {
                required: true,
                minlength: 2,
                maxlength: 100
            },
            'amphur': {
                required: true,
                minlength: 2,
                maxlength: 100
            },
            'province': {
                required: true,
                minlength: 2,
                maxlength: 100
            },
            'zipcode': {
                required: true,
                minlength: 5,
                maxlength: 5
            },
            'role': {
                required: true
            }


        },
        messages: {
            'userID': {
                required: 'กรุณากรอกชื่อผู้ใช้งาน',
                minlength: jQuery.validator.format("กรุณาใส่ข้อมูลมากกว่า {0} ตัวอักษร"),
                maxlength: jQuery.validator.format("กรุณาใส่ข้อมูลน้อยกว่า {0} ตัวอักษร")
            },
            'password': {
                required: 'กรุณากรอกรหัสผ่าน',
                minlength: jQuery.validator.format("กรุณาใส่ข้อมูลมากกว่า {0} ตัวอักษร"),
                maxlength: jQuery.validator.format("กรุณาใส่ข้อมูลน้อยกว่า {0} ตัวอักษร")
            },
            'confirmPassword': {
                required: 'กรุณากรอกรหัสผ่าน',
                minlength: jQuery.validator.format("กรุณาใส่ข้อมูลมากกว่า {0} ตัวอักษร"),
                maxlength: jQuery.validator.format("กรุณาใส่ข้อมูลน้อยกว่า {0} ตัวอักษร"),
                equalTo: 'รหัสผ่านไม่ตรงกัน กรุณาตรวจสอบอีกครั้ง'
            },
            'name': {
                required: 'กรุณากรอกชื่อ',
                minlength: jQuery.validator.format("กรุณาใส่ข้อมูลมากกว่า {0} ตัวอักษร"),
                maxlength: jQuery.validator.format("กรุณาใส่ข้อมูลน้อยกว่า {0} ตัวอักษร")
            },
            'lastname': {
                required: 'กรุณากรอกนามสกุล',
                minlength: jQuery.validator.format("กรุณาใส่ข้อมูลมากกว่า {0} ตัวอักษร"),
                maxlength: jQuery.validator.format("กรุณาใส่ข้อมูลน้อยกว่า {0} ตัวอักษร")
            },
            'address': {
                required: 'กรุณากรอกนามสกุล',
                minlength: jQuery.validator.format("กรุณาใส่ข้อมูลมากกว่า {0} ตัวอักษร"),
                maxlength: jQuery.validator.format("กรุณาใส่ข้อมูลน้อยกว่า {0} ตัวอักษร")
            },
            'district': {
                required: 'กรุณากรอกตำบล',
                minlength: jQuery.validator.format("กรุณาใส่ข้อมูลมากกว่า {0} ตัวอักษร"),
                maxlength: jQuery.validator.format("กรุณาใส่ข้อมูลน้อยกว่า {0} ตัวอักษร")
            },
            'amphur': {
                required: 'กรุณากรอกอำเภอ',
                minlength: jQuery.validator.format("กรุณาใส่ข้อมูลมากกว่า {0} ตัวอักษร"),
                maxlength: jQuery.validator.format("กรุณาใส่ข้อมูลน้อยกว่า {0} ตัวอักษร")
            },
            'province': {
                required: 'กรุณากรอกจังหวัด',
                minlength: jQuery.validator.format("กรุณาใส่ข้อมูลมากกว่า {0} ตัวอักษร"),
                maxlength: jQuery.validator.format("กรุณาใส่ข้อมูลน้อยกว่า {0} ตัวอักษร")
            },
            'zipcode': {
                required: 'กรุณากรอกรหัสไปรษณีย์',
                minlength: jQuery.validator.format("กรุณาใส่ข้อมูลมากกว่า {0} ตัวอักษร"),
                maxlength: jQuery.validator.format("กรุณาใส่ข้อมูลน้อยกว่า {0} ตัวอักษร")
            },
            'role': {
                required: 'กรุณากรอกเลือกระดับสิทธิ์การเข้าใช้งาน'
            }
        }
    });
    $('#example2').DataTable({
        responsive: true,
        ordering: true,
        //order: [[1, "DESC"]],
        columnDefs: [
            { width: "15%", targets: 4, className: "dt-center text-center", "orderable": false },
            { width: "10%", targets: 3 },
            { width: "5%", targets: 0 }
        ],
        language: {
            url: "//cdn.datatables.net/plug-ins/1.10.19/i18n/Thai.json"
        },
        ajax: {
            url: '/Member/LoadData',
            dataSrc: ""

        },
        columns: [
            { data: "number" },
            { data: "name" },
            { data: "lastname" },
            {
                data: "role",
                render: function (data, type, row, meta) {
                    var span = "";
                    if (row.role == "ผู้ดูแลระบบ") {
                        span = '<span class="badge bg-info">ผู้ดูแลระบบ</span>';
                    } else {
                        span = '<span class="badge bg-secondary">พนักงาน</span>';
                    }
                    return span;

                }
            },
            {
                data: "userID",
                render: function (data, type, row, meta) {

                    const edit = `<button onclick="edit('${row.userID}','${row.name}','${row.lastname}','${row.address}','${row.district}','${row.amphur}','${row.province}','${row.zipcode}','${row.keyRole}')" class="btn btn-xs btn-default" type="button" data-toggle="tooltip" data-placement="top"   title="แก้ไขข้อมูลผู้ใช้"><i class="fas fa-edit"></i></button>`;
                    const detail = `<button onclick="detail('${row.userID}')" class="btn btn-xs btn-default" type="button" data-toggle="tooltip" title="รายละเอียดผู้ใช้งาน"><i class="fas fa-info-circle"></i></button>`;
                    const start = `<div class="btn-group">`;
                    const block = `<button onclick="detail('${row.userID}')" class="btn btn-xs btn-danger" type="button" data-toggle="tooltip" title="ระงับการใช้งาน"><i class="fas fa-ban"></i></button>`;
                    const end = `</div>`;
                    $(function () {
                        $('[data-toggle="tooltip"]').tooltip();
                    });
                    return start + edit + detail + block + end;


                }
            }
        ]

    });
    $(document).on('submit',
        '#AddMember',
        function (e) {
            e.preventDefault();
            $.ajax({
                url: '/Member/Create',
                    method: 'POST',
                    data: new FormData(this),
                    contentType: false,
                    processData: false,
                    success: function (data) {
                        if (data === true) {
                            var table2 = $('#example2').DataTable();
                            table2.ajax.reload();
                            document.getElementById("AddOoEdit").value = 0;
                            document.getElementById("userID").value = "";
                            document.getElementById("password").value = "";
                            document.getElementById("confirmPassword").value = "";
                            document.getElementById("name").value = "";
                            document.getElementById("lastname").value = "";
                            document.getElementById("address").value = "";
                            document.getElementById("district").value = "";
                            document.getElementById("amphur").value = "";
                            document.getElementById("province").value = "";
                            document.getElementById("zipcode").value = "";
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


loadFunc();

function loadFunc() {
    var ID = document.getElementById("AddOoEdit").value;
    if (ID !== "0") {
        document.getElementById("btnsubmit").innerHTML = "ยืนยันการแก้ไข";
        $("#btnedit").show();
    } else {

        $("#btnedit").hide();
    }

}

function edit(userID, name, lastname, address, district, amphur, province, zipcode, role) {

    document.getElementById("userID").value = userID;
    document.getElementById("name").value = name;
    document.getElementById("lastname").value = lastname;
    document.getElementById("address").value = address;
    document.getElementById("district").value = district;
    document.getElementById("amphur").value = amphur;
    document.getElementById("province").value = province;
    document.getElementById("zipcode").value = zipcode;
    document.getElementById("AddOoEdit").value = 1;
    $('#role').val(role);
    $('#password').hide();
    $('#userID').prop('readonly', true);
    $('#pass').hide();
    $('#passcon').hide();
    $('#confirmPassword').hide();
    loadFunc();
}
$("#btnedit").click(function () {

    document.getElementById("AddOoEdit").value = 0;
    document.getElementById("userID").value = "";
    document.getElementById("password").value = "";
    document.getElementById("confirmPassword").value = "";
    document.getElementById("name").value = "";
    document.getElementById("lastname").value = "";
    document.getElementById("address").value = "";
    document.getElementById("district").value = "";
    document.getElementById("amphur").value = "";
    document.getElementById("province").value = "";
    document.getElementById("zipcode").value = "";
    loadFunc();
});