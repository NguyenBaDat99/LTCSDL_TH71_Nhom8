using System;
using System.Collections.Generic;
using System.Text;

using LEnglish.Common.DAL;
using System.Linq;

namespace LEnglish.DAL
{
    using LEnglish.Common.Rsp;
    using LEnglish.DAL.Models;
    public class DanhMucRep: GenericRep<LEnglishDBContext, DanhMuc>
    {
        #region --Overrides--
        public override DanhMuc Read(string code)
        {
            var res = All.FirstOrDefault(p => p.MaDanhMuc == code);
            return res;
        }
        #endregion
        public string Remove(string code)
        {
            var m = base.All.First(i => i.MaDanhMuc == code);
            m = base.Delete(m);
            return m.MaDanhMuc;
        }

        public SingleRsp CreateDanhMuc(DanhMuc danhmuc)
        {
            var res = new SingleRsp();
            using (var context = new LEnglishDBContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.DanhMuc.Add(danhmuc);
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

        public SingleRsp UpdateDanhMuc(DanhMuc danhmuc)
        {
            var res = new SingleRsp();
            using (var context = new LEnglishDBContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.DanhMuc.Update(danhmuc);
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

        public SingleRsp RemoveDanhMuc(DanhMuc danhmuc)
        {
            var res = new SingleRsp();
            using (var context = new LEnglishDBContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.DanhMuc.Remove(danhmuc);
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
