using System;
using System.Collections.Generic;
using System.Text;

using LEnglish.Common.DAL;
using System.Linq;

namespace LEnglish.DAL
{
    using LEnglish.Common.Rsp;
    using LEnglish.DAL.Models;
    public class CauHoiRep: GenericRep<LEnglishDBContext, CauHoi>
    {
        #region --Overrides--
        public override CauHoi Read(string code)
        {
            var res = All.FirstOrDefault(p => p.MaCauHoi == code);
            return res;
        }
        #endregion
        public string Remove(string code)
        {
            var m = base.All.First(i => i.MaCauHoi == code);
            m = base.Delete(m);
            return m.MaCauHoi;
        }

        public SingleRsp CreateCauHoi(CauHoi cauhoi)
        {
            var res = new SingleRsp();
            using (var context = new LEnglishDBContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.CauHoi.Add(cauhoi);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            return res;
        }

        public SingleRsp UpdateCauHoi(CauHoi cauhoi)
        {
            var res = new SingleRsp();
            using (var context = new LEnglishDBContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.CauHoi.Update(cauhoi);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            return res;
        }

        public SingleRsp RemoveCauHoi(CauHoi cauhoi)
        {
            var res = new SingleRsp();
            using (var context = new LEnglishDBContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.CauHoi.Remove(cauhoi);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            return res;
        }
    }
}
