using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using LEnglish.DAL.Models;

namespace LEnglish.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BaiTapsController : ControllerBase
    {
        private readonly LEnglishDBContext _context;

        public BaiTapsController(LEnglishDBContext context)
        {
            _context = context;
        }

        // GET: api/BaiTaps
        [HttpGet]
        public async Task<ActionResult<IEnumerable<BaiTap>>> GetBaiTap()
        {
            return await _context.BaiTap.ToListAsync();
        }

        // GET: api/BaiTaps/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BaiTap>> GetBaiTap(string id)
        {
            var baiTap = await _context.BaiTap.FindAsync(id);

            if (baiTap == null)
            {
                return NotFound();
            }

            return baiTap;
        }

        // PUT: api/BaiTaps/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBaiTap(string id, BaiTap baiTap)
        {
            if (id != baiTap.MaBaiTap)
            {
                return BadRequest();
            }

            _context.Entry(baiTap).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BaiTapExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/BaiTaps
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<BaiTap>> PostBaiTap(BaiTap baiTap)
        {
            _context.BaiTap.Add(baiTap);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (BaiTapExists(baiTap.MaBaiTap))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetBaiTap", new { id = baiTap.MaBaiTap }, baiTap);
        }

        // DELETE: api/BaiTaps/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<BaiTap>> DeleteBaiTap(string id)
        {
            var baiTap = await _context.BaiTap.FindAsync(id);
            if (baiTap == null)
            {
                return NotFound();
            }

            _context.BaiTap.Remove(baiTap);
            await _context.SaveChangesAsync();

            return baiTap;
        }

        private bool BaiTapExists(string id)
        {
            return _context.BaiTap.Any(e => e.MaBaiTap == id);
        }
    }
}
