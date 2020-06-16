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
    public class BangDiemController : ControllerBase
    {
        public BangDiemController()
        {
            _svc = new BangDiemSvc();
        }
        private readonly BangDiemSvc _svc;

        [HttpPost("get-by-id")]
        public IActionResult getBangDiemById([FromBody]SimpleReq req)
        {
            var res = new SingleRsp();
            res = _svc.Read(req.Id);
            return Ok(res);
        }

        [HttpPost("get-all")]
        public IActionResult getAllBangDiem()
        {
            var res = new SingleRsp();
            res.Data = _svc.All;
            return Ok(res);
        }

        [HttpPost("search-bangDiem")]
        public IActionResult SearchBangDiem([FromBody]SearchReq req)
        {
            var res = new SingleRsp();
            var nguoidung = _svc.SearchBangDiem(req.Keyword, req.Page, req.Size);
            res.Data = nguoidung;
            return Ok(res);
        }

        [HttpPost("create-bangDiem")]
        public IActionResult CreateBangDiem([FromBody]BangDiemReq req)
        {
            var res = _svc.CreateBangDiem(req);
            return Ok(res);
        }

        [HttpPost("update-bangDiem")]
        public IActionResult UpdateBangDiem([FromBody]BangDiemReq req)
        {
            var res = _svc.UpdateBangDiem(req);
            return Ok(res);
        }

        [HttpPost("remove-bangDiem")]
        public IActionResult RemoveBangDiem([FromBody]SimpleReq req)
        {
            var res = _svc.RemoveBangDiem(req.Id);
            return Ok(res);
        }

        [HttpPost("search-bangDiemCaNhan")]
        public IActionResult SearchBangDiem([FromBody]SimpleReq req)
        {
            var res = new SingleRsp();
            var nguoidung = _svc.SearchBangDiemCaNhan(req.Keyword);
            res.Data = nguoidung;
            return Ok(res);
        }
    }
}