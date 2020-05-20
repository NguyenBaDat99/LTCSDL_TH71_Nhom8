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
    public class NguoiDungController : ControllerBase
    {
        public NguoiDungController()
        {
            _svc = new NguoiDungSvc();
        }
        private readonly NguoiDungSvc _svc;

        [HttpPost("get-by-id")]
        public IActionResult getNguoiDungById([FromBody]SimpleReq req)
        {
            var res = new SingleRsp();
            res = _svc.Read(req.Id);
            return Ok(res);
        }

        [HttpPost("get-all")]
        public IActionResult getAllNguoiDung()
        {
            var res = new SingleRsp();
            res.Data = _svc.All;
            return Ok(res);
        }
        
    }
}