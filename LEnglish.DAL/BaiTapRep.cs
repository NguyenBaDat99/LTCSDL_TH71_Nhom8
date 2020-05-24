using System;
using System.Collections.Generic;
using System.Text;

using LEnglish.Common.DAL;
using System.Linq;

namespace LEnglish.DAL
{
    using LEnglish.Common.Rsp;
    using LEnglish.DAL.Models;
    public class BaiTapRep: GenericRep<LEnglishDBContext, BaiTap>
    {
        #region --Overrides--
        public override BaiTap Read(string code)
        {
            var res = All.FirstOrDefault(p => p.MaBaiTap == code);
            return res;
        }
        #endregion
        public string Remove(string code)
        {
            var m = base.All.First(i => i.MaBaiTap == code);
            m = base.Delete(m);
            return m.MaBaiTap;
        }

        public SingleRsp CreateBaiTap(BaiTap baitap)
        {
            var res = new SingleRsp();
            using (var context = new LEnglishDBContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.BaiTap.Add(baitap);
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

        public SingleRsp UpdateBaiTap(BaiTap baitap)
        {
            var res = new SingleRsp();
            using (var context = new LEnglishDBContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.BaiTap.Update(baitap);
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

        public SingleRsp RemoveBaiTap(BaiTap baitap)
        {
            var res = new SingleRsp();
            using (var context = new LEnglishDBContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.BaiTap.Remove(baitap);
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
