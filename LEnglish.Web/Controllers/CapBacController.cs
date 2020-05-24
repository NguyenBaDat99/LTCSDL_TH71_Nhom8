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
    public class CapBacController : ControllerBase
    {
        public CapBacController()
        {
            _svc = new CapBacSvc();
        }
        private readonly CapBacSvc _svc;

        [HttpPost("get-by-id")]
        public IActionResult getCapBacById([FromBody]SimpleReq req)
        {
            var res = new SingleRsp();
            res = _svc.Read(req.Keyword);
            return Ok(res);
        }

        [HttpPost("get-all")]
        public IActionResult getAllCapBac()
        {
            var res = new SingleRsp();
            res.Data = _svc.All;
            return Ok(res);
        }

        [HttpPost("search-capBac")]
        public IActionResult SearchCapBac([FromBody]SearchReq req)
        {
            var res = new SingleRsp();
            var nguoidung = _svc.SearchCapBac(req.Keyword, req.Page, req.Size);
            res.Data = nguoidung;
            return Ok(res);
        }

        [HttpPost("create-capBac")]
        public IActionResult CreateCapBac([FromBody]CapBacReq req)
        {
            var res = _svc.CreateCapBac(req);
            return Ok(res);
        }

        [HttpPost("update-capBac")]
        public IActionResult UpdateCapBac([FromBody]CapBacReq req)
        {
            var res = _svc.UpdateCapBac(req);
            return Ok(res);
        }

        [HttpPost("remove-capBac")]
        public IActionResult RemoveCapBac([FromBody]SimpleReq req)
        {
            var res = _svc.RemoveCapBac(req.Keyword);
            return Ok(res);
        }

    }
}