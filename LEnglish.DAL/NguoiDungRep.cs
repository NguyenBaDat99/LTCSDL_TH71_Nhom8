using System;
using System.Collections.Generic;
using System.Text;

using LEnglish.Common.DAL;
using System.Linq;

namespace LEnglish.DAL
{
    using LEnglish.DAL.Models;
    public class NguoiDungRep :GenericRep<LEnglishDBContext, NguoiDung>
    {
        #region --Overrides--
        public override NguoiDung Read(int id)
        {
            var res = All.FirstOrDefault(p => p.MaNguoiDung == id);
            return res;
        }
        #endregion
        public int Remove(int id)
        {
            var m = base.All.First(i => i.MaNguoiDung == id);
            m = base.Delete(m);
            return m.MaNguoiDung;
        }
    }
}
