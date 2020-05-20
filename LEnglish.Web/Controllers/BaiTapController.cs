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
    }
}