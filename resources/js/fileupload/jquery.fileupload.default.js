//-----网站图片上传方式公用模板
var fh = window.fh = {};
$(function () {
    $('.J-imgUploadTpl').each(function (i) {
        var self = $(this);
        var img = [];
        if (self.data('img')) {
            img = eval(self.data('img'));
        }
        var data = {
            i: i,
            name: self.data('name'),
            img1: img[0] ? '/file/index/id/' + img[0] : 'js/fileupload/prod_default.gif',
            img2: img[1] ? '/file/index/id/' + img[1] : 'js/fileupload/prod_default.gif',
            img3: img[2] ? '/file/index/id/' + img[2] : 'js/fileupload/prod_default.gif',
            hiden1: img[0] || '',
            hiden2: img[1] || '',
            hiden3: img[2] || ''
        }
        //alert(JSON.stringify(data));
        $.get('js/fileupload/tpl/imgupload.html', function (tpl) {
            self.html(_.template(tpl, data));
            for (var n = 1; n <= 3; n++) {
                myImgUpload('#J-img' + n + i, '#J-fileBtn' + n + i, '#J-file' + n + i);
            }
        });

    });
    //图片上传，
    function myImgUpload(img, fileBtn, file) {
        var _img = _.isString(img) ? $(img) : img;
        var _fileBtn = _.isString(fileBtn) ? $(fileBtn) : fileBtn;
        var _file = _.isString(file) ? $(file) : file;
        _file.fileupload({
            url: '/file/upimage',
            dataType: 'json',
            acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
            change: function (e, data) {
                //alert(JSON.stringify(data.files[0].name));
                if (!/(\.|\/)(gif|jpe?g|png)$/i.test(data.files[0].name)) {
                    alert('图片格式不正确(gif,jpeg,jpg,png)');
                    return false;
                }
                _img.attr('src', "js/fileupload/loading.gif");
            },
            done: function (e, data) {
                //  data.result//上传成功返回的对象数组
                _img.attr('src', "/file/index/id/" + data.result[0].src);
                _img.siblings('input[type=hidden]').val(data.result[0].src);
                //fileBtn.siblings('.fileList').append('<span class="file">'+data.result[0].name+'<font class="x"> </font><span>');
            }
        });
    }

    //----文件上传公用
    window.fh.getFileupload('.J-fileUploadTpl');
    window.fh.getFileupload('.J-fileUploadTplForOne',true);
});

/*
 *@description 保存上传文件
 *@param {obj} form节点
 *@return {}
 **/
window.fh.saveFile = function (form) {
    $(form).find('.J-fileUploadTpl,.J-fileUploadTplForOne').each(function () {
        var arr = [];
        $(this).find('.file').each(function () {
            arr.push($(this).data('id'));
        });
        $(this).find('input[type=hidden]').val(arr.join(','));
    });
}
/*
 *@description 验证上传文件
 *@param {obj} form节点
 *@return {}
 **/
window.fh.checkFileRequired = function (form) {
    var status = 1;
    $(form).find('.J-fileUploadTpl.required:visible,.J-fileUploadTplForOne.required:visible').each(function () {
        if ($(this).find('input[type=hidden]').val() == '') {
            status++;
            $(this).find('.fileList').html(window.errorNo);
        }
    });
    if (status > 1) {
        return false;
    } else {
        return true;
    }
}
window.fh.getFileupload = function (dom,oneFile) {
    var dom = $(dom);
    var progressbar = $('<div class="Progressbar"></div>').appendTo('body');
    var showProgressbar = function (dom, progressbar, state) {
        var offset = dom.offset();
        if (state == 'on') {
            progressbar.show().css({
                left: offset.left,
                top: offset.top - 15,
                'z-index': 9999
            });
        } else {
            progressbar.hide();
        }
    }
    dom.each(function (i) {
        var self = $(this);
        var data = {
            i: i,
            hidden: self.data('name')
        };
        


        $.get('js/fileupload/tpl/fileupload.html', function (tpl) {
            //------初始化文件上传html--------
            var initHtml = self.html();
            self.html(_.template(tpl, data));
            self.find('.fileList').html(initHtml);
            //------绑定上传功能--------
            var file = self.find(':file');
            var fileBtn = self.find('.fileBtn');
            var arr = [];
			
            self.find('.file').each(function () {
                arr.push($(this).attr('data-id'));
            });
           
            //alert(arr.join(','));
            if(self.hasClass("J-fileUploadTplForOne"))
            { 
            
            //传一张
            fileBtn.find('input[type=hidden]').val(arr[0]);

            }
         if(self.hasClass("J-fileUploadTpl"))
        { //传多张
            
           fileBtn.find('input[type=hidden]').val(arr.join(','));   
        }
           // alert(fileBtn.find('input[type=hidden]').val());




            file.fileupload({
                // acceptFileTypes:/(\.|\/)(gif|jpe?g|png)$/i,
                url: '/file/upimage',
                dataType: 'json',
                change: function (e, data) {
                    showProgressbar(fileBtn,progressbar,'on');
                    //alert(JSON.stringify(data.files[0].name));
                },
                done: function (e, data) {
                    showProgressbar(fileBtn,progressbar,'off');
                    //  data.result//上传成功返回的对象数组
                    if (data.result[0]) {
                        fileBtn.siblings('.fileList').find('.error').remove();
                        var html='<span class="file" data-id="' + data.result[0].src + '"><a href="/file/index/id/' + data.result[0].src + '">' + data.result[0].name + '</a><font>删除</font></span>';
                        if(oneFile==true){
                            fileBtn.siblings('.fileList').html(html);
                            fileBtn.find('input[type=hidden]').val(data.result[0].src);
                        }else{
                            fileBtn.siblings('.fileList').append(html);
                            //fileBtn.find('input[type=hidden]').val(data.result[0].src);
							arr = [];
							self.find('.file').each(function () {
                				arr.push($(this).attr('data-id'));
            				});
							fileBtn.find('input[type=hidden]').val(arr.join(','));   
                        }

                    } else {
                        alert('上传失败');
                    }
                }
            });
        });
        //-------删除文件事件-------
        self.on('click', 'font', function () {
			var parent = $(this).parent().parent();
            if (confirm('您确定要删除吗？')) {
				if($(this).parent().siblings().length<1){
					$(this).parent().parent().siblings('.fileBtn').find('input[type=hidden]').val('');
                    $(this).parent().remove();
				}else{
					$(this).parent().remove();
					arr = [];
					self.find('.file').each(function () {
						arr.push($(this).attr('data-id'));
					});
					//alert(parent.attr('class'));
					parent.siblings('.fileBtn').find('input[type=hidden]').val(arr.join(','));
					
				}				
            }
        });
    });
}