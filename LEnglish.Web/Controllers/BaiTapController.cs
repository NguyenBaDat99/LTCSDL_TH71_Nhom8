using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LEnglish.Web.Controllers
{
    using BLL;
    using DAL.Models;
    using Common.Req;
    using System.Collections;
    using Common.Rsp;

    [Route("api/[controller]")]
    [ApiController]
    public class BaiTapController : ControllerBase
    {
        public BaiTapController()
        {
            _svc = new BaiTapSvc();
        }
        private readonly BaiTapSvc _svc;

        [HttpPost("get-by-id")]
        public IActionResult getBaiTapById([FromBody]SimpleReq req)
        {
            var res = new SingleRsp();
            res = _svc.Read(req.Keyword);
            return Ok(res);
        }

        [HttpPost("get-all")]
        public IActionResult getAllBaiTap()
        {
            var res = new SingleRsp();
            res.Data = _svc.All;
            return Ok(res);
        }

        [HttpPost("search-baiTap")]
        public IActionResult SearchBaiTap([FromBody]SearchReq req)
        {
            var res = new SingleRsp();
            var nguoidung = _svc.SearchBaiTap(req.Keyword, req.Page, req.Size);
            res.Data = nguoidung;
            return Ok(res);
        }

        [HttpPost("create-baiTap")]
        public IActionResult CreateBaiTap([FromBody]BaiTapReq req)
        {
            var res = _svc.CreateBaiTap(req);
            return Ok(res);
        }

        [HttpPost("update-baiTap")]
        public IActionResult UpdateBaiTap([FromBody]BaiTapReq req)
        {
            var res = _svc.UpdateBaiTap(req);
            return Ok(res);
        }

        [HttpPost("remove-baiTap")]
        public IActionResult RemoveBaiTap([FromBody]SimpleReq req)
        {
            var res = _svc.RemoveBaiTap(req.Keyword);
            return Ok(res);
        }
    }
}