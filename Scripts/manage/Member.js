

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
                maxlength: 25
            },
            'confirmPassword': {
                required: true,
                minlength: 10,
                maxlength: 25,
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

    $(document).ready(function () {
        $('#formRe').validate({
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
                'in_repass': {
                    required: true,
                    minlength: 10,
                    maxlength: 25
                },
                'in_reconpass': {
                    required: true,
                    minlength: 10,
                    maxlength: 25,
                    equalTo: "#in_repass"
                }
            },
            messages: {
                'in_repass': {
                    required: 'กรุณากรอกรหัสผ่าน',
                    minlength: jQuery.validator.format("กรุณาใส่ข้อมูลมากกว่า {0} ตัวอักษร"),
                    maxlength: jQuery.validator.format("กรุณาใส่ข้อมูลน้อยกว่า {0} ตัวอักษร")

                },
                'in_reconpass': {
                    required: 'กรุณากรอกรหัสผ่าน',
                    minlength: jQuery.validator.format("กรุณาใส่ข้อมูลมากกว่า {0} ตัวอักษร"),
                    maxlength: jQuery.validator.format("กรุณาใส่ข้อมูลน้อยกว่า {0} ตัวอักษร"),
                    equalTo: 'รหัสผ่านไม่ตรงกัน กรุณาตรวจสอบอีกครั้ง'
                }
            }
        });
    });
    $('#example2').DataTable({
        responsive: true,
        ordering: true,
        //order: [[1, "DESC"]],
        columnDefs: [
            { width: "15%", targets: 5, className: "dt-center text-center", "orderable": false },
            { width: "10%", targets: 4, className: "dt-center text-center"},
            { width: "10%", targets: 3, className: "dt-center text-center"},
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
                data: "status",
                render: function (data, type, row, meta) {
                    var span = "";
                    if (row.status == "ใช้งาน") {
                        span = '<span class="badge bg-success">ใช้งาน</span>';
                    } else {
                        span = '<span class="badge bg-secondary">ระงับการใช้งาน</span>';
                    }
                    return span;

                }
            },
            {
                data: "userID",
                render: function (data, type, row, meta) {

                    const edit = `<button onclick="edit('${row.userID}','${row.name}','${row.lastname}','${row.address}','${row.district}','${row.amphur}','${row.province}','${row.zipcode}','${row.keyRole}')" class="btn btn-xs btn-default" type="button" data-toggle="tooltip" data-placement="top"   title="แก้ไขข้อมูลผู้ใช้"><i class="fas fa-edit"></i></button>`;
                    const detail = `<button onclick="detail('${row.userID}','${row.name}','${row.lastname}','${row.address}','${row.district}','${row.amphur}','${row.province}','${row.zipcode}','${row.role}')" class="btn btn-xs btn-default" type="button" data-toggle="tooltip" title="รายละเอียดผู้ใช้งาน"><i class="fas fa-info-circle"></i></button>`;
                    const start = `<div class="btn-group">`;
                    var block = '';
                    if (row.status == "ใช้งาน") {
                        block = `<button onclick="Del('${row.userID}','${row.name}','${row.lastname}')" class="btn btn-xs btn-danger" type="button" data-toggle="tooltip" title="ระงับการใช้งาน"><i class="fas fa-ban"></i></button>`;
                    } else {
                        block = `<button onclick="Enable('${row.userID}','${row.name}','${row.lastname}')" class="btn btn-xs btn-success" type="button" data-toggle="tooltip" title="เปิดการใช้งาน"><i class="fas fa-ban"></i></button>`;
                    }
                    var repass = `<button onclick="Repass('${row.userID}')" class="btn btn-xs btn-default" type="button" data-toggle="tooltip" data-placement="top" title="เปลี่ยนรหัสผ่าน"><i class="fas fa-key"></i></button>`;
                    const end = `</div>`;
                    $(function () {
                        $('[data-toggle="tooltip"]').tooltip();
                    });
                    return start + edit + detail + repass +block  + end;


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
                        $('#role').val(null);
                        loadFunc();
                        toastr.success('แจ้งเตือน, บันทึกข้อมูลเรียบร้อย.');
                    } else {
                        alert(data);
                    }

                }
            },
                'json');
        });
    $(document).on('submit',
        '#formRe',
        function (e) {
            e.preventDefault();
            $.ajax({
                url: '/Member/RePass',
                method: 'POST',
                data: new FormData(this),
                contentType: false,
                processData: false,
                success: function (data) {
                    if (data === true) {
                        document.getElementById("id").value = "";
                        document.getElementById("in_repass").value = "";
                        document.getElementById("in_reconpass").value = "";
                        $('#modal-default2').modal('hide');
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
function Repass(userID) {
    document.getElementById("id").value = userID;
    $('#modal-default2').modal('toggle');
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
    $('#inputOne').hide();
    $('#inputTwo').hide();
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

function detail(userID, name, lastname, address, district, amphur, province, zipcode, role) {
    document.getElementById('showname').innerHTML = 'ชื่อ : ' + name + ' ' + lastname;
    document.getElementById('showaddress').innerHTML = 'ที่อยู่ : ' + address + ' ' + district + ' ' + amphur + ' ' + province + ' ' + zipcode;
    document.getElementById('showrole').innerHTML = 'ระดับสิทธิ์ : ' + role;
    $('#modal-default').modal('toggle')
}

function Del(id, name,lastname) {
    $.confirm({
        title: 'แจ้งเตือน คุณจะยกเลิกการใช้งานหรือไม่!',
        content: `${name}` + ' ' + `${lastname}`,
        type: 'red',
        typeAnimated: true,
        buttons: {
            confirm: {
                text: 'ตกลง',
                btnClass: 'btn-red',
                action: function () {
                    $.ajax({
                        type: "POST",
                        url: "/Member/Delete",
                        data: { id: id },
                        success: function (result) {
                            if (result === true) {
                                var table1 = $('#example2').DataTable();
                                table1.ajax.reload();
                                toastr.info('แจ้งเตือน, แก้ไขเรียบร้อย.')
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

function Enable(id, name, lastname) {
    $.confirm({
        title: 'แจ้งเตือน คุณจะเปิดใช้งานหรือไม่!',
        content: `${name}` + ' ' + `${lastname}`,
        type: 'red',
        typeAnimated: true,
        buttons: {
            confirm: {
                text: 'ตกลง',
                btnClass: 'btn-red',
                action: function () {
                    $.ajax({
                        type: "POST",
                        url: "/Member/Enable",
                        data: { id: id },
                        success: function (result) {
                            if (result === true) {
                                var table1 = $('#example2').DataTable();
                                table1.ajax.reload();
                                toastr.success('แจ้งเตือน, เปิดการใช้เรียบร้อย.')
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