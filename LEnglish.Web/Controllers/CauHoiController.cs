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
    public class CauHoiController : ControllerBase
    {
        public CauHoiController()
        {
            _svc = new CauHoiSvc();
        }
        private readonly CauHoiSvc _svc;

        [HttpPost("get-by-id")]
        public IActionResult getCauHoiById([FromBody]SimpleReq req)
        {
            var res = new SingleRsp();
            res = _svc.Read(req.Keyword);
            return Ok(res);
        }

        [HttpPost("get-all")]
        public IActionResult getAllCauHoi()
        {
            var res = new SingleRsp();
            res.Data = _svc.All;
            return Ok(res);
        }

        [HttpPost("search-cauHoi")]
        public IActionResult SearchCauHoi([FromBody]SearchReq req)
        {
            var res = new SingleRsp();
            var nguoidung = _svc.SearchCauHoi(req.Keyword, req.Page, req.Size);
            res.Data = nguoidung;
            return Ok(res);
        }

        [HttpPost("create-cauHoi")]
        public IActionResult CreateCauHoi([FromBody]CauHoiReq req)
        {
            var res = _svc.CreateCauHoi(req);
            return Ok(res);
        }

        [HttpPost("update-cauHoi")]
        public IActionResult UpdateCauHoi([FromBody]CauHoiReq req)
        {
            var res = _svc.UpdateCauHoi(req);
            return Ok(res);
        }

        [HttpPost("remove-cauHoi")]
        public IActionResult RemoveCauHoi([FromBody]SimpleReq req)
        {
            var res = _svc.RemoveCauHoi(req.Keyword);
            return Ok(res);
        }
    }
}