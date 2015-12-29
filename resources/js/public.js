(function () {
    window.errorYes = '<label class="error"><span class="no">&nbsp;&nbsp;</span></label>';
    window.errorNo = '<label class="error"><span class="no">&nbsp;&nbsp;</span></label>';
    var fh = window.fh = {};
    //-------------------------一些公用函数----------------------
    /*
     *@description 金额格式化
     *@param {string/number} 要处理的字符串
     *@param {string} 处理方式，（'num':转换为数值表示，'str':转换为字符串表示‘xxx,xxx.xx’）；
     *@return {string|number} 返回处理结果
     **/
    fh.moneyFormat = function (str, type) {
        str = '' + str;
        var re1 = /^[-+]?\d+(\.\d{1,2})?$/.test($.trim(str));//匹配数字金额
        var re2 = /^[-+]?\d{1,3}(,\d{3})*(\.\d{1,2})?$/.test($.trim(str));//匹配字符串金额
        var status = re1 || re2;
        if (!status) {//格式不符合返回空
            return '';
        } else {
            if (type == 'num') {//转换为数值
                return $.trim(str.replace(/[,+]/g, ''));
            } else {//默认转换为字符串金额
                var _str = $.trim(str.replace(/[,+]/g, ''));
                _str = _str.replace(/^(-?\d*)$/, "$1.") + '00';
                _str = _str.replace(/(-?\d*\.\d\d)\d*/, "$1");
                //    console.info(s);
                _str = _str.replace(".", ",");
                //     console.info(s);
                var re = /(\d)(\d{3},)/;
                while (re.test(_str)) {
                    _str = _str.replace(re, "$1,$2");
                }
                _str = _str.replace(/,(\d\d)$/, ".$1");
                return _str.replace(/^\./, "0.");
            }
        }
    };
    fh.moneyEvent = function (form) {
        //初始化
        form.find('.J-money').each(function () {
            var h = $(this).siblings('input[type=hidden]');
            $(this).val(fh.moneyFormat(h.val(), 'str'));
            h.val(fh.moneyFormat(h.val(), 'num'));
        });
        form.find('.J-count').each(function () {
            $(this).html(fh.moneyFormat($.trim($(this).text()), 'str'));
        });
        //绑定事件
        form.on('focus', '.J-money', function () {
            var value = fh.moneyFormat($(this).val(), 'num');
            $(this).val(value);
        });
        form.on('blur', '.J-money', function () {
            $(this).siblings('input[type=hidden]').val(fh.moneyFormat($(this).val(), 'num'));
            var value = fh.moneyFormat($(this).val(), 'str');
            $(this).val(value);
        });
		
		form.find('.input_blur').click(function(){
			$('.J-money').each(function(){
				$(this).siblings('input[type=hidden]').val(fh.moneyFormat($(this).val(), 'num'));
				//alert($(this).siblings('input[type=hidden]').val());
            	var value = fh.moneyFormat($(this).val(), 'str');
            	$(this).val(value);
			})
		})
    };
    /*
     *@description 展开收起
     *@param {string|number}
     *@return {string|number}
     **/
    fh.tableDown = function (table) {
        table.on('click', '.flexBtn', function () {
            var btn = $(this);
            var slice = table.data('slice');
            var tr = null;
            if (slice) {
                tr = table.find('tr').slice(slice[0], slice[1]);
            } else {
                tr = table.find('tr').slice(1);
            }
            if (btn.is('.mainlevel')) {
                btn.removeClass('mainlevel').addClass('childlevel').text('收起');
                tr.show();
            } else {
                btn.addClass('mainlevel').removeClass('childlevel').text('展开');
                tr.hide();
            }
        });

    };
    /*
     *@description 输入的字符数统计
     *@param {string|object}
     *@param {string|object}
     *@param {int}
     *@return {string|object}
     **/
    fh.TextCount = function (input, b, maxNum) {
        this.input = typeof input === 'string' ? $(input) : input;
        this.b = typeof b === 'string' ? $(b) : b;
        this.maxNum = parseInt(maxNum,10);
        this.init();
    };
    fh.TextCount.prototype.init = function () {
        this.count();
        this.input.on('keyup', $.proxy(this.count, this));
    };
    fh.TextCount.prototype.count = function () {
        //   console.info(this.input.val().length);
        this.b.html(this.maxNum - this.input.val().length);
    };
    //获取当月最大日期(year[当年]，month[当月]，style[输出格式])
    fh.getMaxDate = function (year, month, style) {
        var temp = new Date((new Date(year, parseInt(month,10), 1)).getTime() - 1000 * 60 * 60 * 24);
        var rs = '';
        switch (style) {
            case 'full': //返回格式 year-month-date
                rs = year + '-' + month + '-' + temp.getDate();
                break;
            case 'date': //只返回date
                rs = temp.getDate();
                break;
            case 'arr'://返回格式[year,month,date]
                rs = [year, month, temp.getDate()];
                break;
            case 'obj':
                rs = new Date(year, month - 1, temp.getDate());
            case 'times'://返回时间戳
                rs=temp.getTime()
        }
        return rs;
    }
    //根据有效的日期对象返回xxxx-xx-xx格式的日期
    fh.getDate = function (obj) {
        var year = obj.getFullYear();
        var month = obj.getMonth() + 1;
        var date = obj.getDate();
        if (month < 10) {
            month = '0' + month;
        }
        if (date < 10) {
            date = '0' + date;
        }
        return year + '-' + month + '-' + date
    };
    //根据xxxx-xx-xx格式的日期得到时间戳,n为加减天数
    fh.getTimes = function (date,n) {
        var arr = date.split('-');
        var y=parseInt(arr[0],10);
        var m=parseInt(arr[1],10)-1;
        var d=parseInt(arr[2],10);
        n=n?n:0;
        return (new Date(y,m,d)).getTime()+n*24*60*60*1000
    };
    //加法，累加(只截取两位小数)
    $.fn.jiafa = function (attr) {
        if (!attr) {
            attr = this.is('input') ? 'value' : 'text';
        }
        var num = 0;
        this.each(function () {
            var v;
            if (attr == 'text') {
                v = $(this).text();
            } else {
                v = $(this).attr(attr);
            }
            num += parseFloat(v) ? parseFloat(v) : 0;
        });
        return  Math.round(num * 100) / 100;
    };

})();
$(function () {

    $('table.table_list td.head').parent().children('td:last').css('background-position', 'left 0');
    //-------页面左侧导航-------
    $('.sidebar dl dt').nextUntil('dt').hide();
    $('.sidebar dl dt.down').nextUntil('dt').show();
    $('.sidebar').on('click', 'dt', function () {
        $(this).siblings('dd').hide();
        $(this).nextUntil('dt').show();
        $(this).addClass('down').siblings().removeClass('down');
    });
    //-------列表页表格  #J-listTable-------
    var listPageTable = $('#J-listPageTable');
    if (listPageTable.length == 1) {
        /*//背景
        $('#J-listPageTable tr:even').css('background', '#eff8fd');
        $('#J-listPageTable tr:odd').css('background', '#fff');
        //鼠标移上效果
        listPageTable.on('hover', 'tr', function () {
            if (!$(this).is('.J-h')) {
                $(this).children('td').toggleClass('bgpink');
            }
        });*/
        //全选反选
        listPageTable.on('click', ':checkbox', function () {
            if ($(this).is('.J-all')) {

                if ($(this).is(':checked')) {

                    listPageTable.find(':checkbox:enabled').attr('checked', true);
                } else {
                    listPageTable.find(':checkbox:enabled').removeAttr('checked');
                }
            } else {
                if ($(this).is(':checked')) {

                } else {
                    listPageTable.find(':checkbox.J-all').removeAttr('checked');
                }
            }
        });
        //全选删除
        listPageTable.on('click', ':submit', function () {
            if (listPageTable.find(':checkbox:checked').length > 0) {
                return confirm('您确定要' + $(this).val() + '吗？');
            } else {
                alert('请选择条目');
                return false;
            }
        });
    }
    //-----------------删除操作提示-------------------------
    $('.J-confirm').live('click', function () {
        if ($(this).is('a')) {
            return confirm('您确定要' + $.trim($(this).text()) + '吗？');
        }
        if ($(this).is(':button')) {
            if (confirm('您确定要' + $.trim($(this).val()) + '吗？')) {
                if ($(this).attr('url')) {
                    window.location.href = $(this).attr('url');
                }
            }
        }
        if ($(this).is(':submit')) {
            return confirm('您确定要' + $.trim($(this).val()) + '吗？');
        }
    });
    //-------------ajax层级选项卡（收缩版 .J-ajaxSelect1）----------------
    ajaxSelect('.J-ajaxSelect1');
    //-------------ajax层级选项卡（不收缩版 .J-ajaxSelect2）--------------
    ajaxSelect('.J-ajaxSelect2');
    function ajaxSelect(container) {
        $(container).each(function () {
            var parent = $(this);//选项卡的父容器
            parent.on('change', 'select', function () {
                var url = parent.data('url') || $(this).data('url');
                var curSel = $(this);
                var key = curSel.val();
                clear(parent, curSel, container);
                if (key != 0) {
                    $.getJSON(url + '/' + key, function (data) {
                        var op = '';
                        $.each(data, function (i, n) {
                            op += '<option value="' + n.id + '">' + n.name + '</option>';
                        });
                        if (container === '.J-ajaxSelect1' && op == '') {
                            curSel.nextAll('select').remove();
                            return;
                        }
                        if (container === '.J-ajaxSelect2' && op == '') {
                            return;
                        }
                        if (container === '.J-ajaxSelect1' && curSel.next('select').length == 0) {
                            var index = parent.find('select').index(curSel);
                            var arr = eval(parent.data('select'));
                            curSel.after('<select name="' + arr[index][0] + '"><option value="0">' + arr[index][1] + '</option></select>');
                        }
                        curSel.next('select').append(op);
                    });
                }
            });
        });
        function clear(parent, changSel, container) {
            if (container === '.J-ajaxSelect1') {//收缩版
                if (changSel.val() == 0) {
                    changSel.nextAll('select').remove();
                } else {
                    changSel.next('select').find(':first').nextAll().remove();
                    changSel.next('select').nextAll('select').remove();
                }
            } else {//不收缩版
                changSel.nextAll('select').each(function () {
                    $(this).find(':first').nextAll().remove();
                });
            }
        }
    }

    $('table.boline').each(function () {
        fh.tableDown($(this));
    });
});